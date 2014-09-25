require 'test_helper'

feature 'I want to sign out user' do
  scenario 'User logs out' do
    visit '/'
    click_on 'Login'
    fill_in 'Email', with: users(:me).email
    fill_in 'Password', with: '12345678'
    click_on 'Log in'
    click_link 'Logout'
    page.must_have_content 'Signed out successfully'
    page.wont_have_content 'There was a problem with your sign out'
  end
end
