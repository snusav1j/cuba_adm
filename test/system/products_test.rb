require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "should create product" do
    visit products_url
    click_on "New product"

    fill_in "Author", with: @product.author_id
    fill_in "Available", with: @product.available
    fill_in "Buy price", with: @product.buy_price
    fill_in "Description", with: @product.description
    fill_in "Marketplace", with: @product.marketplace
    fill_in "Product name", with: @product.product_name
    fill_in "Sell price", with: @product.sell_price
    fill_in "Sold", with: @product.sold
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "should update Product" do
    visit product_url(@product)
    click_on "Edit this product", match: :first

    fill_in "Author", with: @product.author_id
    fill_in "Available", with: @product.available
    fill_in "Buy price", with: @product.buy_price
    fill_in "Description", with: @product.description
    fill_in "Marketplace", with: @product.marketplace
    fill_in "Product name", with: @product.product_name
    fill_in "Sell price", with: @product.sell_price
    fill_in "Sold", with: @product.sold
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "should destroy Product" do
    visit product_url(@product)
    click_on "Destroy this product", match: :first

    assert_text "Product was successfully destroyed"
  end
end
