require "test_helper"

class DirectMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get messages" do
    get direct_messages_messages_url
    assert_response :success
  end
end
