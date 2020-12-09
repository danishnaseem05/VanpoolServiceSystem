class PagesController < ApplicationController
  before_action :set_current_user

  def home
  end

  def welcome
    @users = User.where(approved: false, driver: true)

    user = User.find_by(session_token: session[:session_token])
    if !user.nil?
      @admin = user.admin
      @driver = user.driver
      @rider = user.rider
    else
      redirect_to root_path
    end
  end

end
