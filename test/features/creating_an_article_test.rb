require 'test_helper'

feature 'Creating an article' do
  scenario 'submit a form for a new article' do
    # Given I have created an article about aardvarks
    visit new_article_path

    fill_in 'Title', with: 'An aardvark article'
    fill_in 'Body', with: 'Too many aardvarks'

    # When I submit the aardvark article
    click_on 'Create Article'

    # Then the aardvark article will be created and displayed
    page.text.must_include 'Article was successfully created'
    page.text.must_include 'Too many aardvarks'

  end
end
