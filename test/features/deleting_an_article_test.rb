require 'test_helper'

feature 'Deleting an article' do
  scenario 'article is clicked for delete' do
    # Given an article
    visit articles_path(articles(:aardvark))

    # When I click destroy
    page.find('tbody tr:last').click_on 'Destroy'

    # Then the article is deleted and shown a confirmation
    page.wont_have_content articles(:aardvark).body
  end
end
