require 'securerandom'

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      # Note: don't do this in production - use real auth!!
      cookies[:user_id] ||
        reject_unauthorized_connection
    end
  end
end
