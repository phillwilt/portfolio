require "test_helper"

class CanAccessWelcomeTest < Capybara::Rails::TestCase
  def test test_welcome_page_message
    visit root_path
    access page.has_content? "Welcome"
    # assert_content page, "Welcome"
  end
end
