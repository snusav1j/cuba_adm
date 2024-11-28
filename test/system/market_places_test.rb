require "application_system_test_case"

class MarketPlacesTest < ApplicationSystemTestCase
  setup do
    @market_place = market_places(:one)
  end

  test "visiting the index" do
    visit market_places_url
    assert_selector "h1", text: "Market places"
  end

  test "should create market place" do
    visit market_places_url
    click_on "New market place"

    fill_in "Marketplace name", with: @market_place.marketplace_name
    click_on "Create Market place"

    assert_text "Market place was successfully created"
    click_on "Back"
  end

  test "should update Market place" do
    visit market_place_url(@market_place)
    click_on "Edit this market place", match: :first

    fill_in "Marketplace name", with: @market_place.marketplace_name
    click_on "Update Market place"

    assert_text "Market place was successfully updated"
    click_on "Back"
  end

  test "should destroy Market place" do
    visit market_place_url(@market_place)
    click_on "Destroy this market place", match: :first

    assert_text "Market place was successfully destroyed"
  end
end
