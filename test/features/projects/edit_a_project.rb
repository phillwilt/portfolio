require 'test_helper'

feature 'edit an existing project' do
  scenario 'edit a project' do
    visit project_path(projects(:philwilt))

    fill_in 'Name',  with: projects(:philwilt).name

    click_on 'Submit'

    page.text.must_include 'successfully updated'
  end
end
