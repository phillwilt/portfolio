require 'test_helper'

feature 'delete a project' do
  scenario 'click delete project' do
    visit project_path(projects(:codefellows))

    click_on 'Delete'

    page.text.must_include 'Project destroyed successfully'
  end
end
