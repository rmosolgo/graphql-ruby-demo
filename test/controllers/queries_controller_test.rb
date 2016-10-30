require 'test_helper'

class QueriesControllerTest < ActionController::TestCase
  setup do

  end

  test "should execute the graphql query" do
    post :create, query: '{ __schema }', format: :json

    assert_response :success
  end
end
