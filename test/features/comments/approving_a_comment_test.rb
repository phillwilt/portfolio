require 'test_helper'

feature 'Approving an article comment' do
  scenario 'as an author I want to approve a comment' do
    sign_in(:author)
    visit article_path(articles(:aardvark))
    click_on 'Approve'

    page.text.must_include 'Comment approved'
  end

  scenario 'as an editor I want to approve a comment' do
    sign_in(:editor)
    visit article_path(articles(:aardvark))
    click_on 'Approve'

    page.text.must_include 'Comment approved'
  end

  scenario 'as an author I want to unapprove a comment' do
    sign_in(:author)
    visit article_path(articles(:ant))
    click_on 'Unapprove'

    page.text.must_include 'Comment unapproved'
  end

  scenario 'as an editor I want to unapprove a comment' do
    sign_in(:editor)
    visit article_path(articles(:ant))
    click_on 'Unapprove'

    page.text.must_include 'Comment unapproved'
  end
end
