require 'test_helper'

feature 'Visiting the Article Index' do
  scenario 'with existing articles' do
    # Given there are articles
    assert !Article.all.empty?

    # When I visit /articles
    visit articles_path

    # Then the existing articles should show
    page.text.must_include Article.first.body
  end
end
