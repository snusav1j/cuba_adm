require "application_system_test_case"

class SuperLogsTest < ApplicationSystemTestCase
  setup do
    @super_log = super_logs(:one)
  end

  test "visiting the index" do
    visit super_logs_url
    assert_selector "h1", text: "Super logs"
  end

  test "should create super log" do
    visit super_logs_url
    click_on "New super log"

    fill_in "Action", with: @super_log.action
    fill_in "Log", with: @super_log.log_id
    fill_in "Log type", with: @super_log.log_type
    fill_in "User", with: @super_log.user_id
    click_on "Create Super log"

    assert_text "Super log was successfully created"
    click_on "Back"
  end

  test "should update Super log" do
    visit super_log_url(@super_log)
    click_on "Edit this super log", match: :first

    fill_in "Action", with: @super_log.action
    fill_in "Log", with: @super_log.log_id
    fill_in "Log type", with: @super_log.log_type
    fill_in "User", with: @super_log.user_id
    click_on "Update Super log"

    assert_text "Super log was successfully updated"
    click_on "Back"
  end

  test "should destroy Super log" do
    visit super_log_url(@super_log)
    click_on "Destroy this super log", match: :first

    assert_text "Super log was successfully destroyed"
  end
end
