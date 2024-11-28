require "application_system_test_case"

class ProductPhotosTest < ApplicationSystemTestCase
  setup do
    @product_photo = product_photos(:one)
  end

  test "visiting the index" do
    visit product_photos_url
    assert_selector "h1", text: "Product photos"
  end

  test "should create product photo" do
    visit product_photos_url
    click_on "New product photo"

    fill_in "Photo name", with: @product_photo.photo_name
    fill_in "Product", with: @product_photo.product_id
    click_on "Create Product photo"

    assert_text "Product photo was successfully created"
    click_on "Back"
  end

  test "should update Product photo" do
    visit product_photo_url(@product_photo)
    click_on "Edit this product photo", match: :first

    fill_in "Photo name", with: @product_photo.photo_name
    fill_in "Product", with: @product_photo.product_id
    click_on "Update Product photo"

    assert_text "Product photo was successfully updated"
    click_on "Back"
  end

  test "should destroy Product photo" do
    visit product_photo_url(@product_photo)
    click_on "Destroy this product photo", match: :first

    assert_text "Product photo was successfully destroyed"
  end
end
