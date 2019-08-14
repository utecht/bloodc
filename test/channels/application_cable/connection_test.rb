require "test_helper"

class ApplicationCable::ConnectionTest < ActionCable::Connection::TestCase
  # test "connects with cookies" do
  #   cookies.signed[:user_id] = 42
  #
  #   connect
  #
  #   assert_equal connection.user_id, "42"
  # end
  test "connects as a player" do
    cookies.encrypted[:player_id] = players(:alice).id
    connect
    assert_equal connection.current_user, "player_#{players(:alice).id}"
  end
end
