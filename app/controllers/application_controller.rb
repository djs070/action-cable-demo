class ApplicationController < ActionController::Base
  before_action :set_user

  private

  def set_user
    return if cookies.signed[:user_id].blank?

    @current_user = cookies.signed[:user_id]
    @username = cookies.signed[:username]
  end
end
