require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a game has players" do
    assert games(:game_one).players.count > 0
  end
end
