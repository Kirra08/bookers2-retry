require "test_helper"

class GroupMailsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get group_mails_new_url
    assert_response :success
  end

  test "should get index" do
    get group_mails_index_url
    assert_response :success
  end

  test "should get edit" do
    get group_mails_edit_url
    assert_response :success
  end
end
