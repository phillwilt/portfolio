require 'test_helper'

feature 'Creating an article' do
  scenario 'author creates an article' do

    sign_in(:author)

    visit new_article_path

    fill_in 'Title', with: articles(:aardvark).title
    fill_in 'Body', with: articles(:aardvark).body

    # When I submit the article
    click_on 'Create Article'

    # Then the article will be created and displayed
    page.text.must_include 'Article was successfully created'
    page.text.must_include articles(:aardvark).body

    page.text.must_include 'Status: Unpublished'
  end

  scenario 'unauthorized site visitor cannot create an article' do
    visit new_article_path
    page.text.must_include 'You need to sign in'
  end

  scenario 'unauthorized visitor cannot see new article button' do
    visit articles_path
    page.wont_have_link 'New Article'
  end
end
