require 'test_helper'

feature 'show an index of all projects' do
  scenario 'index the projects' do
    visit projects_path
    page.text.must_include projects(:codefellows).name
  end
end
