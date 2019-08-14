require 'test_helper'

class LobbyControllerTest < ActionDispatch::IntegrationTest
  test "a new user is directed to welcome page" do
    get "/"
    assert_response :success
  end
end
