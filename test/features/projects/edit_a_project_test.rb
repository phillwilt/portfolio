require 'test_helper'

feature 'edit an existing project' do
  scenario 'edit a project' do
    visit edit_project_path(projects(:philwilt))

    fill_in 'Name',  with: projects(:philwilt).name

    click_on 'Update Project'

    page.text.must_include 'successfully updated'
  end

  scenario 'edit project has invalid data' do
    visit edit_project_path(projects(:philwilt))

    fill_in 'Name',  with: projects(:invalid).name
    fill_in 'Technologies', with: projects(:invalid).technologies

    click_on 'Update Project'

    page.text.must_include 'too short'
    page.text.must_include "can't be blank"
  end
end
