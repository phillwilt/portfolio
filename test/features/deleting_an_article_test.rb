require 'test_helper'

feature 'Deleting an article' do
  scenario 'article is clicked for delete' do
    # Given an article
    article = Article.create(
                              title: 'An Aardvark Article',
                              body: 'Too many aardvarks'
                            )

    visit articles_path

    # When I click destroy
    page.find('tr:last').click_on 'Destroy'

    # Then the article is deleted and shown a confirmation
    page.wont_have_content 'Too many aardvarks'
  end
end
