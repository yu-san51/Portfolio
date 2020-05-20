require 'test_helper'

class TeachersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get teachers_show_url
    assert_response :success
  end

  test "should get edit" do
    get teachers_edit_url
    assert_response :success
  end

  test "should get update" do
    get teachers_update_url
    assert_response :success
  end

  test "should get deleted_at" do
    get teachers_deleted_at_url
    assert_response :success
  end

end
