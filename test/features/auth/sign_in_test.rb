require 'test_helper'

feature 'sign in with OmniAuth' do
  scenario 'sign in with twitter works' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:twitter,
                             uid: '12345',
                             info: { nickname: 'test_twitter_user' })
    visit new_user_session_path
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]

    click_link 'Sign in with Twitter'
    page.must_have_content 'test_twitter_user@twitter.example.com, you are signed in!'
  end
end
# Courtesy of: https://gist.github.com/ivanoats/7071730
# with help from https://github.com/intridea/omniauth/wiki/Integration-Testing
