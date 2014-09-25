require 'test_helper'

feature 'I want to create a registered user' do
  scenario 'I want to create a valid user' do
    visit '/'

    click_on 'Sign Up'

    fill_in 'Email', with: 'me@here.com'
    fill_in 'Password', with: 'jefiajfoaij'
    fill_in 'Password confirmation', with: 'jefiajfoaij'

    click_on 'Sign up'

    page.must_have_content 'Welcome! You have signed up successfully'
    page.wont_have_content 'There was a problem with your sign up'
  end
end
