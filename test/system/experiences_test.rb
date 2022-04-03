require "application_system_test_case"

class ExperiencesTest < ApplicationSystemTestCase
  test "visiting the index" do
    login_as users(:rosty)
    visit experiences_url
    # save_and_open_screenshot
    assert_selector "h2", text: "Murphy's Irish Pub"
    assert_selector ".experience-card", count: Experience.count
  end

  test "signing in and creating an experience" do
    login_as users(:rosty)
    visit "/experiences/new"
    # save_and_open_screenshot

    fill_in "experience_name", with: "Walhalla"
    select "Restaurant", from: "experience_event_type"
    # fill_in "event_type", with: "restaurant"
    fill_in "Search", with: "Krefelder Str. 6, 10555 Berlin"
    # save_and_open_screenshot

    # page.should have_selector('ul.ui-autocomplete li.ui-menu-item a')
    # page.execute_script %Q{ $('#{selector}').trigger('mouseenter').click() }

    # select "mapboxgl-ctrl-geocoder--suggestion-title", from: "mapboxgl-ctrl-geocoder--input"

    # save_and_open_screenshot

    click_on 'Create Experience'
    # save_and_open_screenshot

    # Should be redirected to Home with new product
    assert_equal experiences_path, page.current_path
    # save_and_open_screenshot

  end
end
