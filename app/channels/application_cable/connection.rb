module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      if cookies.encrypted.has_key?(:player_id)
        self.current_user = "player_#{cookies.encrypted[:player_id]}"
      elsif cookies.encrypted.has_key?(:game_id)
        self.current_user = "host_#{cookies.encrypted[:game_id]}"
      else
        reject_unauthorized_connection
      end
    end
  end
end
