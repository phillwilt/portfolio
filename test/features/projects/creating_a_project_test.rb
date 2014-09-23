require 'test_helper'

feature 'Creating a project' do

  scenario 'index the projects' do

  end

  scenario 'create a new project'  do
    visit projects_path

    fill_in 'Name',  with: projects(:codefellows).name
    fill_in 'Technologies', with: projects(:codefellows).technologies

    click_on 'Create Project'

    page.text.must_include 'Project was successfully created'
    page.text.must_include projects(:codefellows).name
  end

  scenario 'edit a project' do
  end

  scenario 'delete a project' do
  end
end
