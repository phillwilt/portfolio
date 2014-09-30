require 'test_helper'

feature 'Posting an article comment' do
  scenario 'as a visitor I want to post a comment' do
    visit article_path(articles(:aardvark))

    fill_in 'Content', with: comments(:ants).content
    fill_in 'Author', with: comments(:ants).author
    fill_in 'Author url', with: comments(:ants).author_url
    fill_in 'Author email', with: comments(:ants).author_email
    click_on 'Create Comment'
    page.text.must_include 'Comment pending approval'
  end

  scenario 'as a visitor when I post a comment I wont see it until approved' do
    visit articles_path(articles(:aardvark))

    fill_in 'Content', with: comments(:ants)
    click_on 'Create Comment'

    page.text.wont_include comments(:ants)
  end

end
