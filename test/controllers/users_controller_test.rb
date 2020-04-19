require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get history" do
    get users_history_url
    assert_response :success
  end

end
