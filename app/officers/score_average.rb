# frozen_string_literal: true

# Score Average Processor
class ScoreAverage
  attr_reader :params, :errors, :result

  def initialize(params)
    @params = params
    @errors = []
    @result = { scores: {} }
  end

  def perform
    scores.each do |group, objects|
      return false unless validate_scores(objects)

      result[:scores][group.to_sym] = calculate_avg(group, objects)
    end
    return false unless duplicated_user?

    true
  rescue StandardError
    @errors = ['Error Occured when Processing Data']
    false
  end

  private

  def scores
    @scores ||= params[:scores].to_h
  end

  def validate_scores(objects)
    between_score_range?(objects) && single_user_in_group?(objects)
  end

  def between_score_range?(objects)
    # score between 1 - 5
    passed = objects.all? { |obj| obj['score'].between?(1, 5) }
    @errors = ['Score must between 1 - 5'] unless passed
    passed
  end

  def single_user_in_group?(objects)
    # minimum of a single user to be present in a group
    passed = objects.group_by { |obj| obj['userId'] }.none? { |_k, v| v.count > 1 }
    @errors = ['Minimum of a single user to be present in a group']
    passed
  end

  def duplicated_user?
    # user can only belong into a single group
    passed = scores.values.flatten.group_by { |obj| obj['userId'] }.map { |_k, v| v.count }.none? { |v| v > 1 }
    @errors = ['User with more than one group detected'] unless passed
    passed
  end

  def calculate_avg(group, objects)
    return 0 if group != 'managers' && objects.size <= 3

    objects.map { |v| v['score'] }.sum / objects.size.to_f
  end
end
