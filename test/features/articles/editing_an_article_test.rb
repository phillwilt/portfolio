require 'test_helper'

feature 'Editing an article' do
  scenario 'as an author I want to edit an article' do
    sign_in(:author)
    # Given a form to edit an article
    visit article_path(articles(:aardvark))
    # When I submit the edit
    click_on 'Edit'
    fill_in 'Body', with: articles(:ant).body
    click_on 'Update Article'

    # Then I want to update and view the article
    page.text.must_include 'Article was successfully updated'
    page.text.must_include articles(:ant).body
  end

  scenario 'as an editor I want to edit an article' do
    sign_in(:editor)
    # Given a form to edit an article
    visit article_path(articles(:aardvark))
    # When I submit the edit
    click_on 'Edit'
    fill_in 'Body', with: articles(:ant).body
    click_on 'Update Article'

    # Then I want to update and view the article
    page.text.must_include 'Article was successfully updated'
    page.text.must_include articles(:ant).body
  end
end
