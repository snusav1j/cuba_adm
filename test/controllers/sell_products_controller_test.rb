require "test_helper"

class SellProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sell_product = sell_products(:one)
  end

  test "should get index" do
    get sell_products_url
    assert_response :success
  end

  test "should get new" do
    get new_sell_product_url
    assert_response :success
  end

  test "should create sell_product" do
    assert_difference("SellProduct.count") do
      post sell_products_url, params: { sell_product: { product_id: @sell_product.product_id, sell_price: @sell_product.sell_price } }
    end

    assert_redirected_to sell_product_url(SellProduct.last)
  end

  test "should show sell_product" do
    get sell_product_url(@sell_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_sell_product_url(@sell_product)
    assert_response :success
  end

  test "should update sell_product" do
    patch sell_product_url(@sell_product), params: { sell_product: { product_id: @sell_product.product_id, sell_price: @sell_product.sell_price } }
    assert_redirected_to sell_product_url(@sell_product)
  end

  test "should destroy sell_product" do
    assert_difference("SellProduct.count", -1) do
      delete sell_product_url(@sell_product)
    end

    assert_redirected_to sell_products_url
  end
end
