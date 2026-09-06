require "test_helper"

class AdminConsoleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_console_index_url
    assert_response :success
  end

  test "should get create" do
    get admin_console_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_console_edit_url
    assert_response :success
  end

  test "should get show" do
    get admin_console_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_console_destroy_url
    assert_response :success
  end
end
