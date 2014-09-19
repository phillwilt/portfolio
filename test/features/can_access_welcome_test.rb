require 'test_helper'

class CanAccessWelcomeTest < Capybara::Rails::TestCase
  def test_welcome_page_message
    visit root_path
    page.has_content? 'Welcome'
  end
end
