require 'test_helper'

feature 'Creating an article' do
  scenario 'site owner creates an article' do

    sign_in

    visit new_article_path

    fill_in 'Title', with: articles(:aardvark).title
    fill_in 'Body', with: articles(:aardvark).body

    # When I submit the article
    click_on 'Create Article'

    # Then the article will be created and displayed
    page.text.must_include 'Article was successfully created'
    page.text.must_include articles(:aardvark).body

    page.has_css? '#author'
    page.text.must_include users(:me).email
  end
end
