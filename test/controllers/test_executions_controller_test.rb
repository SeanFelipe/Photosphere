require "test_helper"

class TestExecutionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_execution = test_executions(:one)
  end

  test "should get index" do
    get test_executions_url, as: :json
    assert_response :success
  end

  test "should create test_execution" do
    assert_difference('TestExecution.count') do
      post test_executions_url, params: { test_execution: { details: @test_execution.details, execution_time: @test_execution.execution_time, result: @test_execution.result, test_case_id: @test_execution.test_case_id } }, as: :json
    end

    assert_response 201
  end

  test "should show test_execution" do
    get test_execution_url(@test_execution), as: :json
    assert_response :success
  end

  test "should update test_execution" do
    patch test_execution_url(@test_execution), params: { test_execution: { details: @test_execution.details, execution_time: @test_execution.execution_time, result: @test_execution.result, test_case_id: @test_execution.test_case_id } }, as: :json
    assert_response 200
  end

  test "should destroy test_execution" do
    assert_difference('TestExecution.count', -1) do
      delete test_execution_url(@test_execution), as: :json
    end

    assert_response 204
  end
end
