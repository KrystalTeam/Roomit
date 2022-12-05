require "test_helper"

class RoomControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get room_home_url
    assert_response :success
  end
end
