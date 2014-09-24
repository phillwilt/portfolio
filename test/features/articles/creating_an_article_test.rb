require 'test_helper'

feature 'Creating an article' do
  scenario 'submit a form for a new article' do
    # Given I have created an article
    visit new_article_path

    fill_in 'Title', with: articles(:aardvark).title
    fill_in 'Body', with: articles(:aardvark).body

    # When I submit the article
    click_on 'Create Article'

    # Then the article will be created and displayed
    page.text.must_include 'Article was successfully created'
    page.text.must_include articles(:aardvark).body

  end
end
