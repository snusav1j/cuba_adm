require "test_helper"

class SuperLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @super_log = super_logs(:one)
  end

  test "should get index" do
    get super_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_super_log_url
    assert_response :success
  end

  test "should create super_log" do
    assert_difference("SuperLog.count") do
      post super_logs_url, params: { super_log: { action: @super_log.action, log_id: @super_log.log_id, log_type: @super_log.log_type, user_id: @super_log.user_id } }
    end

    assert_redirected_to super_log_url(SuperLog.last)
  end

  test "should show super_log" do
    get super_log_url(@super_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_super_log_url(@super_log)
    assert_response :success
  end

  test "should update super_log" do
    patch super_log_url(@super_log), params: { super_log: { action: @super_log.action, log_id: @super_log.log_id, log_type: @super_log.log_type, user_id: @super_log.user_id } }
    assert_redirected_to super_log_url(@super_log)
  end

  test "should destroy super_log" do
    assert_difference("SuperLog.count", -1) do
      delete super_log_url(@super_log)
    end

    assert_redirected_to super_logs_url
  end
end
