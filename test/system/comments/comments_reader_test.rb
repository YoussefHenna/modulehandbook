require 'application_system_test_case'
require 'system/comments/comments_system_test/comments_system_test'
class CommentsReaderTest < CommentsSystemTest

  def setup
    @course = courses(:one)
    @user = users(:reader)
    own_comments_setup_helper
  end

  test 'as reader i can create a comment on a course' do
    comments_course
  end

  test 'as reader i can read own comment' do
    read_own_comment
  end

  test 'as reader i can read others comment' do
    read_others_comment
  end

  test 'as reader i can edit and update own comment' do
    edit_and_update_own_comment
  end

  test 'as reader i cannot edit and update others comment' do
    cannot_edit_and_update_others_comment
  end

  test 'as reader i can delete and destroy own comment' do
    delete_and_destroy_own_comment
  end

  test 'as reader i cannot delete and destroy others comment' do
    cannot_delete_and_destroy_others_comment
  end
end
