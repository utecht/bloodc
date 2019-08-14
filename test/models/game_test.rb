require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a game has players" do
    assert games(:game_one).players.count > 0
  end

  test "a game name must be unique" do
    g = Game.new(name: games(:game_one).name)
    assert_not g.valid?
  end
end
