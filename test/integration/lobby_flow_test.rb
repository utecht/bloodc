require 'test_helper'

class LobbyFlowTest < ActionDispatch::IntegrationTest
  test "can start or join game on welcome page" do
    get "/"
    assert_select "input[value='Host Game']"
    assert_select "input[value='Join Game']"
  end

  test "can host a game" do
    post "/host",
      params: { game: { name: "test game", edition: "Trouble Brewing" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "Waiting for players"
  end

  test "can join an existing game" do
    post "/join",
      params: { name: "Joe", game: games(:game_one).name }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "Waiting on role"
  end
end
