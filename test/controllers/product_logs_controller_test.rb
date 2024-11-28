require "test_helper"

class ProductLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_log = product_logs(:one)
  end

  test "should get index" do
    get product_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_product_log_url
    assert_response :success
  end

  test "should create product_log" do
    assert_difference("ProductLog.count") do
      post product_logs_url, params: { product_log: { action: @product_log.action, product_id: @product_log.product_id } }
    end

    assert_redirected_to product_log_url(ProductLog.last)
  end

  test "should show product_log" do
    get product_log_url(@product_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_log_url(@product_log)
    assert_response :success
  end

  test "should update product_log" do
    patch product_log_url(@product_log), params: { product_log: { action: @product_log.action, product_id: @product_log.product_id } }
    assert_redirected_to product_log_url(@product_log)
  end

  test "should destroy product_log" do
    assert_difference("ProductLog.count", -1) do
      delete product_log_url(@product_log)
    end

    assert_redirected_to product_logs_url
  end
end
