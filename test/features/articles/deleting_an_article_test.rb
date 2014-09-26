require 'test_helper'

feature 'Deleting an article' do
  scenario 'article is clicked for delete' do
    sign_in(:editor)
    # Given an article
    article = articles(:aardvark)
    body = article.body
    visit article_path(article)

    # When I click destroy
    click_link('Destroy')

    # Then the article is deleted and shown a confirmation
    page.wont_have_content body
  end
end
