require "test_helper"

class TestCasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_case = test_cases(:one)
  end

  test "should get index" do
    get test_cases_url, as: :json
    assert_response :success
  end

  test "should create test_case" do
    assert_difference('TestCase.count') do
      post test_cases_url, params: { test_case: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show test_case" do
    get test_case_url(@test_case), as: :json
    assert_response :success
  end

  test "should update test_case" do
    patch test_case_url(@test_case), params: { test_case: {  } }, as: :json
    assert_response 200
  end

  test "should destroy test_case" do
    assert_difference('TestCase.count', -1) do
      delete test_case_url(@test_case), as: :json
    end

    assert_response 204
  end
end
