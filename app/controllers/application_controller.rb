# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::API
  def render_success(data: {}, messages: [])
    render json: {
      success: true,
      data: data,
      errors: messages
    }, status: 200
  end

  def render_error(messages: [])
    render json: {
      success: false,
      data: {},
      errors: messages
    }, status: 422
  end
end
