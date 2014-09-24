require 'test_helper'

feature 'Projects' do

  scenario 'create a new project'  do
    visit new_project_path

    fill_in 'Name',  with: projects(:codefellows).name
    fill_in 'Technologies', with: projects(:codefellows).technologies

    click_on 'Create Project'

    page.text.must_include "#{projects(:codefellows).name} was" \
                            ' successfully created'
    page.text.must_include projects(:codefellows).name
  end

  scenario 'new project has invalid data' do
    visit new_project_path

    fill_in 'Name',  with: projects(:invalid).name
    fill_in 'Technologies', with: projects(:invalid).technologies

    click_on 'Create Project'

    page.text.must_include 'too short'
    page.text.must_include "can't be blank"
  end

  scenario 'delete a project' do
  end
end
