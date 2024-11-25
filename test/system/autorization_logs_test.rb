require "application_system_test_case"

class AutorizationLogsTest < ApplicationSystemTestCase
  setup do
    @autorization_log = autorization_logs(:one)
  end

  test "visiting the index" do
    visit autorization_logs_url
    assert_selector "h1", text: "Autorization logs"
  end

  test "should create autorization log" do
    visit autorization_logs_url
    click_on "New autorization log"

    fill_in "User", with: @autorization_log.user_id
    click_on "Create Autorization log"

    assert_text "Autorization log was successfully created"
    click_on "Back"
  end

  test "should update Autorization log" do
    visit autorization_log_url(@autorization_log)
    click_on "Edit this autorization log", match: :first

    fill_in "User", with: @autorization_log.user_id
    click_on "Update Autorization log"

    assert_text "Autorization log was successfully updated"
    click_on "Back"
  end

  test "should destroy Autorization log" do
    visit autorization_log_url(@autorization_log)
    click_on "Destroy this autorization log", match: :first

    assert_text "Autorization log was successfully destroyed"
  end
end
