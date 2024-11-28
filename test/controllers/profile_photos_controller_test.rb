require "test_helper"

class ProfilePhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile_photo = profile_photos(:one)
  end

  test "should get index" do
    get profile_photos_url
    assert_response :success
  end

  test "should get new" do
    get new_profile_photo_url
    assert_response :success
  end

  test "should create profile_photo" do
    assert_difference("ProfilePhoto.count") do
      post profile_photos_url, params: { profile_photo: { photo_name: @profile_photo.photo_name, photo_url: @profile_photo.photo_url, user_id: @profile_photo.user_id } }
    end

    assert_redirected_to profile_photo_url(ProfilePhoto.last)
  end

  test "should show profile_photo" do
    get profile_photo_url(@profile_photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_photo_url(@profile_photo)
    assert_response :success
  end

  test "should update profile_photo" do
    patch profile_photo_url(@profile_photo), params: { profile_photo: { photo_name: @profile_photo.photo_name, photo_url: @profile_photo.photo_url, user_id: @profile_photo.user_id } }
    assert_redirected_to profile_photo_url(@profile_photo)
  end

  test "should destroy profile_photo" do
    assert_difference("ProfilePhoto.count", -1) do
      delete profile_photo_url(@profile_photo)
    end

    assert_redirected_to profile_photos_url
  end
end
