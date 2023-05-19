require "application_system_test_case"

class QuestionnairesTest < ApplicationSystemTestCase
  setup do
    @questionnaire = questionnaires(:one)
  end

  test "visiting the index" do
    visit questionnaires_url
    assert_selector "h1", text: "Questionnaires"
  end

  test "should create questionnaire" do
    visit questionnaires_url
    click_on "New questionnaire"

    fill_in "Q1", with: @questionnaire.q1
    fill_in "Q2", with: @questionnaire.q2
    fill_in "Q3", with: @questionnaire.q3
    fill_in "Q4", with: @questionnaire.q4
    fill_in "Q5", with: @questionnaire.q5
    fill_in "User", with: @questionnaire.user_id
    click_on "Create Questionnaire"

    assert_text "Questionnaire was successfully created"
    click_on "Back"
  end

  test "should update Questionnaire" do
    visit questionnaire_url(@questionnaire)
    click_on "Edit this questionnaire", match: :first

    fill_in "Q1", with: @questionnaire.q1
    fill_in "Q2", with: @questionnaire.q2
    fill_in "Q3", with: @questionnaire.q3
    fill_in "Q4", with: @questionnaire.q4
    fill_in "Q5", with: @questionnaire.q5
    fill_in "User", with: @questionnaire.user_id
    click_on "Update Questionnaire"

    assert_text "Questionnaire was successfully updated"
    click_on "Back"
  end

  test "should destroy Questionnaire" do
    visit questionnaire_url(@questionnaire)
    click_on "Destroy this questionnaire", match: :first

    assert_text "Questionnaire was successfully destroyed"
  end
end
