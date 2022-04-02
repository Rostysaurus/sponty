require "application_system_test_case"

class ExperiencesTest < ApplicationSystemTestCase
  test "visiting the index" do
    login_as users(:rosty)
    visit experiences_url
    # save_and_open_screenshot
    assert_selector "h2", text: "Murphy's Irish Pub"
    assert_selector ".experience-card", count: Experience.count
  end
end
