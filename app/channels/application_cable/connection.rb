module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      if id = cookies.encrypted[:player_id]
        self.current_user = "player_#{id}"
      elsif id = cookies.encrypted[:game_id]
        self.current_user = "host_#{id}"
      else
        reject_unauthorized_connection
      end
    end
  end
end
