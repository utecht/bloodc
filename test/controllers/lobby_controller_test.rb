require 'test_helper'

class LobbyControllerTest < ActionDispatch::IntegrationTest
  test "a new user is directed to welcome page" do
    get "/"
    assert_response :success
  end

  test "can host a new game" do
    assert_difference('Game.count', 1) do
      post '/host', params: { game: { name: 'test', edition: 'Trouble Brewing'} }
    end
  end

  test "can join existing game" do
    assert_difference('games(:game_one).players.count', 1) do
      post '/join', params: { name: "Carol", game: games(:game_one).name}
    end
  end

  test "correct editions are in hosting form" do
    get "/"
    assert_select "option", "Trouble Brewing"
  end
end
