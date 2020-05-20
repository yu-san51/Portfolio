require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get students_show_url
    assert_response :success
  end

  test "should get edit" do
    get students_edit_url
    assert_response :success
  end

  test "should get update" do
    get students_update_url
    assert_response :success
  end

  test "should get deleted_at" do
    get students_deleted_at_url
    assert_response :success
  end

end
