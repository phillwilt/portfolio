require 'test_helper'

feature 'Posting an article comment' do
  scenario 'as a visitor I want to post a comment' do
    visit article_path(articles(:aardvark))

    fill_in 'Content', with: comments(:ants).content
    fill_in 'Author', with: comments(:ants).author
    fill_in 'Website', with: comments(:ants).author_url
    fill_in 'Email', with: comments(:ants).author_email
    click_on 'Create Comment'
    page.text.must_include 'Comment pending approval'
  end

  scenario 'as a visitor when I post a comment I wont see it until approved' do
    visit article_path(articles(:aardvark))

    fill_in 'Content', with: comments(:ants).content
    click_on 'Create Comment'

    page.text.wont_include comments(:ants).content
  end

end
