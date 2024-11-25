require "test_helper"

class AutorizationLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @autorization_log = autorization_logs(:one)
  end

  test "should get index" do
    get autorization_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_autorization_log_url
    assert_response :success
  end

  test "should create autorization_log" do
    assert_difference("AutorizationLog.count") do
      post autorization_logs_url, params: { autorization_log: { user_id: @autorization_log.user_id } }
    end

    assert_redirected_to autorization_log_url(AutorizationLog.last)
  end

  test "should show autorization_log" do
    get autorization_log_url(@autorization_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_autorization_log_url(@autorization_log)
    assert_response :success
  end

  test "should update autorization_log" do
    patch autorization_log_url(@autorization_log), params: { autorization_log: { user_id: @autorization_log.user_id } }
    assert_redirected_to autorization_log_url(@autorization_log)
  end

  test "should destroy autorization_log" do
    assert_difference("AutorizationLog.count", -1) do
      delete autorization_log_url(@autorization_log)
    end

    assert_redirected_to autorization_logs_url
  end
end
