require 'test_helper'

class GameControllerTest < ActionController::TestCase
  test "host can lock a game" do
    id = games(:game_one).id
    post :lock, session: {game_id: id}
    assert_equal Game.find(id).phase, 'assignment'
  end
end
