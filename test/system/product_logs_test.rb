require "application_system_test_case"

class ProductLogsTest < ApplicationSystemTestCase
  setup do
    @product_log = product_logs(:one)
  end

  test "visiting the index" do
    visit product_logs_url
    assert_selector "h1", text: "Product logs"
  end

  test "should create product log" do
    visit product_logs_url
    click_on "New product log"

    fill_in "Action", with: @product_log.action
    fill_in "Product", with: @product_log.product_id
    click_on "Create Product log"

    assert_text "Product log was successfully created"
    click_on "Back"
  end

  test "should update Product log" do
    visit product_log_url(@product_log)
    click_on "Edit this product log", match: :first

    fill_in "Action", with: @product_log.action
    fill_in "Product", with: @product_log.product_id
    click_on "Update Product log"

    assert_text "Product log was successfully updated"
    click_on "Back"
  end

  test "should destroy Product log" do
    visit product_log_url(@product_log)
    click_on "Destroy this product log", match: :first

    assert_text "Product log was successfully destroyed"
  end
end
