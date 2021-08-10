require 'securerandom'

# A hacky, not-production-ready implementation of authentication
# for the purpose of demoing Action Cable
class SessionController < ApplicationController
  def create
    username = params[:username]
    user_id = SecureRandom.uuid

    cookies.signed[:username] = username
    cookies.signed[:user_id] = user_id

    flash[:alert] = "Logged in as #{username}"
    ActionCable.server.broadcast 'logins', login_message(user_id, username)
    redirect_to root_path
  end

  def destroy
    cookies.delete(:username)
    cookies.delete(:user_id)
  end

  private

  def login_message(user_id, username)
    {
      username: username,
      user_id: user_id,
      message: "#{username} just logged in",
      time: Time.now.utc
    }
  end
end
