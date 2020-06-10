require 'test_helper'

class ContractsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get contracts_new_url
    assert_response :success
  end

  test "should get confirm" do
    get contracts_confirm_url
    assert_response :success
  end

  test "should get create" do
    get contracts_create_url
    assert_response :success
  end

  test "should get update" do
    get contracts_update_url
    assert_response :success
  end

  test "should get show" do
    get contracts_show_url
    assert_response :success
  end

end
