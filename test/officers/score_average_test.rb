# frozen_string_literal: true

require 'test_helper'

class ScoreAverageTest < ActionView::TestCase
  test 'between score range error' do
    params = ActionController::Parameters.new({"scores":{"managers":[{"userId":1,"score":6},{"userId":2,"score":5}],"team":[{"userId":4,"score":1},{"userId":5,"score":5},{"userId":6,"score":3},{"userId":7,"score":2}],"others":[{"userId":8,"score":1},{"userId":9,"score":5}]}})
    officer = ScoreAverage.new(params.permit!)
    officer.perform
    assert_equal ['Score must between 1 - 5'], officer.errors
  end

  test 'minimum of a single user to be present in a group' do
    params = ActionController::Parameters.new({"scores":{"managers":[{"userId":1,"score":1},{"userId":1,"score":5}],"team":[{"userId":4,"score":1},{"userId":5,"score":5},{"userId":6,"score":3},{"userId":7,"score":2}],"others":[{"userId":8,"score":1},{"userId":9,"score":5}]}})
    officer = ScoreAverage.new(params.permit!)
    officer.perform
    assert_equal ['Minimum of a single user to be present in a group'], officer.errors
  end

  test 'user with more than one group' do
    params = ActionController::Parameters.new({"scores":{"managers":[{"userId":1,"score":1},{"userId":2,"score":5}],"team":[{"userId":1,"score":1},{"userId":5,"score":5},{"userId":6,"score":3},{"userId":7,"score":2}],"others":[{"userId":8,"score":1},{"userId":9,"score":5}]}})
    officer = ScoreAverage.new(params.permit!)
    officer.perform
    assert_equal ['User with more than one group detected'], officer.errors
  end

  test 'correct answer' do
    params = ActionController::Parameters.new({"scores":{"managers":[{"userId":1,"score":1},{"userId":2,"score":5}],"team":[{"userId":4,"score":1},{"userId":5,"score":5},{"userId":6,"score":3},{"userId":7,"score":2}],"others":[{"userId":8,"score":1},{"userId":9,"score":5}]}})
    officer = ScoreAverage.new(params.permit!)
    officer.perform
    assert_equal 3.0, officer.result[:scores][:managers]
    assert_equal 2.75, officer.result[:scores][:team]
    assert_equal 0, officer.result[:scores][:others]
  end
end
