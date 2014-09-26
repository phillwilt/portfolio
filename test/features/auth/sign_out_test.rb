require 'test_helper'

feature 'I want to sign out user' do
  scenario 'User logs out' do
    sign_in(:editor)
    click_link 'Logout'
    page.must_have_content 'Signed out successfully'
    page.wont_have_content 'There was a problem with your sign out'
  end
end
