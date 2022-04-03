require "test_helper"

class ExperienceTest < ActiveSupport::TestCase
  test "experience cannot be created without a name, event_type and address" do
    experience = Experience.new(name: "Walhalla")
    assert_not experience.save
  end
end
