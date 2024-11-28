require "application_system_test_case"

class ProfilePhotosTest < ApplicationSystemTestCase
  setup do
    @profile_photo = profile_photos(:one)
  end

  test "visiting the index" do
    visit profile_photos_url
    assert_selector "h1", text: "Profile photos"
  end

  test "should create profile photo" do
    visit profile_photos_url
    click_on "New profile photo"

    fill_in "Photo name", with: @profile_photo.photo_name
    fill_in "Photo url", with: @profile_photo.photo_url
    fill_in "User", with: @profile_photo.user_id
    click_on "Create Profile photo"

    assert_text "Profile photo was successfully created"
    click_on "Back"
  end

  test "should update Profile photo" do
    visit profile_photo_url(@profile_photo)
    click_on "Edit this profile photo", match: :first

    fill_in "Photo name", with: @profile_photo.photo_name
    fill_in "Photo url", with: @profile_photo.photo_url
    fill_in "User", with: @profile_photo.user_id
    click_on "Update Profile photo"

    assert_text "Profile photo was successfully updated"
    click_on "Back"
  end

  test "should destroy Profile photo" do
    visit profile_photo_url(@profile_photo)
    click_on "Destroy this profile photo", match: :first

    assert_text "Profile photo was successfully destroyed"
  end
end
