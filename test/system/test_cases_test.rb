require "application_system_test_case"

class TestCasesTest < ApplicationSystemTestCase
  setup do
    @test_case = test_cases(:one)
  end

  test "visiting the index" do
    visit test_cases_url
    assert_selector "h1", text: "Test Cases"
  end

  test "creating a Test case" do
    visit test_cases_url
    click_on "New Test Case"

    fill_in "Automationstatus", with: @test_case.automationStatus
    fill_in "Description", with: @test_case.description
    fill_in "Summary", with: @test_case.summary
    click_on "Create Test case"

    assert_text "Test case was successfully created"
    click_on "Back"
  end

  test "updating a Test case" do
    visit test_cases_url
    click_on "Edit", match: :first

    fill_in "Automationstatus", with: @test_case.automationStatus
    fill_in "Description", with: @test_case.description
    fill_in "Summary", with: @test_case.summary
    click_on "Update Test case"

    assert_text "Test case was successfully updated"
    click_on "Back"
  end

  test "destroying a Test case" do
    visit test_cases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Test case was successfully destroyed"
  end
end
