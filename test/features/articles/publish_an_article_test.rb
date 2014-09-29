require 'test_helper'

feature 'Publish an article' do
  scenario 'an author cannot publish an article'do
    sign_in(:author)
    visit new_article_path

    fill_in 'Title', with: articles(:aardvark).title
    fill_in 'Body', with: articles(:aardvark).body

    # When I submit the article
    click_on 'Create Article'

    page.wont_have_field('Published')
  end

  scenario 'editor can publish an article' do
    sign_in(:editor)

    visit new_article_path
    page.must_have_field('Published')

    fill_in 'Title', with: articles(:aardvark).title
    fill_in 'Body', with: articles(:aardvark).body
    check 'Publish'

    click_on 'Create Article'
  end
end
