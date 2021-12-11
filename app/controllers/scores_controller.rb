# frozen_string_literal: true

# Score Controller
class ScoresController < ApplicationController
  def index
    officer = ScoreAverage.new(params.permit!)
    return render_error(messages: officer.errors) unless officer.perform

    render_success(data: officer.result)
  end
end
