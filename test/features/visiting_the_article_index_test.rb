require 'test_helper'

feature 'Visiting the Article Index' do
  scenario 'with existing articles' do
    # Given there are articles
    Article.create(title: 'An Aardvark Article', body: 'Too many aardvarks')

    # When I visit /articles
    visit articles_path

    # Then the existing articles should show
    page.text.must_include 'Too many aardvarks'
  end
end
