require 'application_system_test_case'

class VersionsEditorTest < ApplicationSystemTestCase
  def setup
    @course = courses(:one)
    @user = @user_editor = users(:editor)
    @user_other = users(:writer)
    system_test_login(@user.email, 'geheim12')
  end

  test 'logged in as editor' do
    visit root_path
    assert_text 'Logged in as ' + @user.email
  end

  def create_version(responsible_person:, ects:)
    click_on 'Edit'
    fill_in 'course_responsible_person', with: responsible_person
    fill_in 'course_ects', with: ects
    click_on 'Update Course'
    assert_text 'Course was successfully updated.'
  end

  test 'as editor i can create a version on a course' do
    visit course_path(@course)
    create_version(responsible_person: 'Me', ects: '2')
    click_on 'See Course Versions'
    assert_text 'Version History of'
    assert_text 'Updated ects: 1 -> 2'
  end

  test 'as editor i can see versions of a course' do
    visit course_path(@course)
    create_version(responsible_person: 'Me', ects: '2')
    click_on 'See Course Versions'
    assert_text 'Version History of'
    assert_text 'Updated ects: 1 -> 2'
  end

  test 'as editor i can revert to a version of a course' do
    visit course_path(@course)
    create_version(responsible_person: 'Me', ects: '2')
    create_version(responsible_person: 'Not Me', ects: '5')
    click_on 'See Course Versions'
    assert_text 'Version History of'
    click_on 'Revert to this Version', match: :first
    refute_text 'Not Me'
    assert_text 'Me'
  end
end
