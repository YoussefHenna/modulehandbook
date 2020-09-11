require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #describe "create_from_json creates valid course" do
    test "create_from_json creates valid course with all details provided" do
      course_json = JSON.parse('{
        "id": 1,
        "name": "Informatik  1",
        "code": "B2",
        "mission": nil,
        "ects": 4,
        "examination": nil,
        "objectives": nil,
        "contents": nil,
        "prerequisites": nil,
        "literature": nil,
        "methods": "P SL/Ü",
        "skills_knowledge_understanding": nil,
        "skills_intellectual": nil,
        "skills_practical": nil,
        "skills_general": nil,
        "created_at": "2020-08-13T13:27:21.179Z",
        "updated_at": "2020-08-13T13:27:21.179Z",
        "lectureHrs": nil,
        "labHrs": nil,
        "tutorialHrs": nil,
        "equipment": nil,
        "room": nil
        }'.gsub('nil', 'null'))
        assert_difference('Course.count', 1) do
          course = Course.create_from_json(course_json)
          assert_equal course.code, course_json['code']
        end
      end

      test "create_from_json creates valid course with not all details provided" do
        course_json = JSON.parse('{
          "name": "Informatik  1",
          "code": "B3"
          }')
          assert_difference('Course.count', 1) do
            course = Course.create_from_json(course_json)
            assert_equal course.code, course_json['code']
          end
        end
    #end
  end
