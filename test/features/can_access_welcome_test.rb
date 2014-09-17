require "test_helper"

class CanAccessWelcomeTest < Capybara::Rails::TestCase
  test "welcome message" do
    visit root_path
    assert_content page, "Welcome"
    refute_content page, "Goobye All!"
  end
end
