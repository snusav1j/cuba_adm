require "test_helper"

class ProductPhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_photo = product_photos(:one)
  end

  test "should get index" do
    get product_photos_url
    assert_response :success
  end

  test "should get new" do
    get new_product_photo_url
    assert_response :success
  end

  test "should create product_photo" do
    assert_difference("ProductPhoto.count") do
      post product_photos_url, params: { product_photo: { photo_name: @product_photo.photo_name, product_id: @product_photo.product_id } }
    end

    assert_redirected_to product_photo_url(ProductPhoto.last)
  end

  test "should show product_photo" do
    get product_photo_url(@product_photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_photo_url(@product_photo)
    assert_response :success
  end

  test "should update product_photo" do
    patch product_photo_url(@product_photo), params: { product_photo: { photo_name: @product_photo.photo_name, product_id: @product_photo.product_id } }
    assert_redirected_to product_photo_url(@product_photo)
  end

  test "should destroy product_photo" do
    assert_difference("ProductPhoto.count", -1) do
      delete product_photo_url(@product_photo)
    end

    assert_redirected_to product_photos_url
  end
end
