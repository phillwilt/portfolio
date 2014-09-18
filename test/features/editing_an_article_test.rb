require 'test_helper'

feature 'Editing an article' do
  scenario 'when I edit an article' do
    # Given a form to edit an article
    article = Article.create(
                              title: 'An Aardvark Article',
                              body: 'Too many aardvarks'
                            )

    visit article_path(article)
    # When I submit the edit
    click_on 'Edit'
    fill_in 'Body', with: 'Too few ants'
    click_on 'Update Article'

    # Then I want to update and view the article
    page.text.must_include 'Article was successfully updated'
    page.text.must_include 'Too few ants'
  end
end
