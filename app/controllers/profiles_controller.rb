class ProfilesController < ApplicationController
  before_action :set_current_user

  def index
    @user = User.where(session_token: session[:session_token])
    #@user_id = user.user_id
    #@email = user.email
    #@first_name = user.first_name
    #@last_name = user.last_name
    #@phone_number = user.phone_number
  end

  def update
    #redirect back to driver or rider page
  end
end