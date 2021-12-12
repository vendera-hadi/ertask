# frozen_string_literal: true

require 'test_helper'

# Score controller test
class ScoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @correct_params = {"scores":{"managers":[{"userId":1,"score":1},{"userId":2,"score":5}],"team":[{"userId":4,"score":1},{"userId":5,"score":5},{"userId":6,"score":3},{"userId":7,"score":2}],"others":[{"userId":8,"score":1},{"userId":9,"score":5}]}}
    @fail_params = {"scores":{"managers":[{"userId":1,"score":1},{"userId":2,"score":5}],"team":[{"userId":1,"score":1},{"userId":5,"score":5},{"userId":6,"score":3},{"userId":7,"score":2}],"others":[{"userId":8,"score":1},{"userId":9,"score":5}]}}
  end

  test 'should get index success response' do
    get scores_url, params: @success_params
    assert_response :success
  end

  test 'should get index fail response' do
    get scores_url, params: @fail_params
    assert_response 422
  end
end
