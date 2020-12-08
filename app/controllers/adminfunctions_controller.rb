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
    redirect_to pages_welcome_path
  end

  def addUser
  end

  def deleteUser
    user = User.find_by(session_token: session[:session_token])
    user_to_remove = User.find_by(user_id: user_params[:user_id])
    if user_params[:user_id] == '' || user_to_remove.nil?
      flash[:notice] = "No such user found."
    else
      user_to_remove.destroy
      flash[:notice] = "#{user_params[:user_id]} was successfully removed from the database."
    end
    redirect_to pages_welcome_path
  end

  def approveDriver
    begin
      params[:unapproved_drivers].keys.each do |id|
        id = id.to_i
        user = User.find_by(id: id)
        user.approved = true
        user.save
      end
    rescue
      flash[:notice] = "No Driver(s) Selected"
      redirect_to pages_welcome_path and return
    end
    flash[:notice] = "Driver(s) Successfully Approved"
    redirect_to pages_welcome_path
  end

end