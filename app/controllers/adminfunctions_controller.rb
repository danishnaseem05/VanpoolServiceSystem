class AdminfunctionsController < ApplicationController

  def user_params
    params.require(:user).permit(:user_id)
  end

  def makeAdmin
    user = User.find_by(session_token: session[:session_token])
    user_to_make_admin = User.find_by(user_id: user_params[:user_id])
    if user_params[:user_id] == '' || user_to_make_admin.nil?
      flash[:notice] = "No such user found."
    else
      flash[:notice] = "line 13"
      user_to_make_admin.admin = true
      user_to_make_admin.save
      flash[:notice] = "#{user_params[:user_id]} successfully made admin."
    end
    if user.driver
      redirect_to pages_driver_path
    elsif user.rider
      redirect_to pages_rider_path
    end
  end

  def addUser
  end

  def deleteUser
  end

end