module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :message_user
    include SessionsHelper

    def connect
      self.message_user = find_verified_user
    end

    def find_verified_user
      if logged_in?
        current_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
