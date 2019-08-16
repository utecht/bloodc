require 'test_helper'

class GameControllerTest < ActionController::TestCase
  test "host can lock a game" do
    id = games(:game_one).id
    cookies.encrypted[:game_id] = id
    post :lock
    assert_equal Game.find(id).phase, 'assignment'
  end
end
