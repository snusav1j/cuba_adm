require "application_system_test_case"

class SellProductsTest < ApplicationSystemTestCase
  setup do
    @sell_product = sell_products(:one)
  end

  test "visiting the index" do
    visit sell_products_url
    assert_selector "h1", text: "Sell products"
  end

  test "should create sell product" do
    visit sell_products_url
    click_on "New sell product"

    fill_in "Product", with: @sell_product.product_id
    fill_in "Sell price", with: @sell_product.sell_price
    click_on "Create Sell product"

    assert_text "Sell product was successfully created"
    click_on "Back"
  end

  test "should update Sell product" do
    visit sell_product_url(@sell_product)
    click_on "Edit this sell product", match: :first

    fill_in "Product", with: @sell_product.product_id
    fill_in "Sell price", with: @sell_product.sell_price
    click_on "Update Sell product"

    assert_text "Sell product was successfully updated"
    click_on "Back"
  end

  test "should destroy Sell product" do
    visit sell_product_url(@sell_product)
    click_on "Destroy this sell product", match: :first

    assert_text "Sell product was successfully destroyed"
  end
end
