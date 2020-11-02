class PagesController < ApplicationController
  before_action :set_current_user

  def home
  end

  def driver
    user = User.find_by(session_token: session[:session_token])
    @admin = user.admin
  end

  def rider
    user = User.find_by(session_token: session[:session_token])
    @admin = user.admin
  end

end
