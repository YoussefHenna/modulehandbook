require 'test_helper'

class CourseProgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_program = course_programs(:one)
  end

  test "should get index" do
    get course_programs_url
    assert_response :success
  end

  test "should get new" do
    get new_course_program_url
    assert_response :success
  end

  test "should create course_program" do
    assert_difference('CourseProgram.count') do
      post course_programs_url, params: { course_program: { course_id: @course_program.course_id, program_id: @course_program.program_id, required: @course_program.required, semester: @course_program.semester } }
    end

    assert_redirected_to course_program_url(CourseProgram.last)
  end

  test "should show course_program" do
    get course_program_url(@course_program)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_program_url(@course_program)
    assert_response :success
  end

  test "should update course_program" do
    patch course_program_url(@course_program), params: { course_program: { course_id: @course_program.course_id, program_id: @course_program.program_id, required: @course_program.required, semester: @course_program.semester } }
    assert_redirected_to course_program_url(@course_program)
  end

  test "should destroy course_program" do
    assert_difference('CourseProgram.count', -1) do
      delete course_program_url(@course_program)
    end

    assert_redirected_to course_programs_url
  end
end