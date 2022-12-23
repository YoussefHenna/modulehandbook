require 'application_system_test_case'
require 'system/comments/comments_system_test/comments_system_test'
class CommentsEditorOthersTest < CommentsSystemTest
  def setup
    @course = courses(:one)
    @user = users(:editor)
    other_comments_setup_helper
  end

    test 'as editor i can read others comment' do
      read_others_comment
    end

    test 'as editor i cant edit and update others comment' do
      cannot_edit_and_update_others_comment
    end

    test 'as editor i cant delete and destroy others comment' do
      cannot_delete_and_destroy_others_comment
    end
end
