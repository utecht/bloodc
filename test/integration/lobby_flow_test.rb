require 'test_helper'

class LobbyFlowTest < ActionDispatch::IntegrationTest
  test "can start or join game on welcome page" do
    get "/"
    assert_select "button", "Host Game"
    assert_select "button", "Join Game"
  end
end
