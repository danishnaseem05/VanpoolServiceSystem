class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:user_id, :email, :session_token, :password)
  end

  def new
    # default: render 'new' template
  end

  def create
    begin
      #  @user = User.create_user!(user_params)
      flash[:notice] = "Welcome #{@user.user_id}. Your account has been created."
      redirect_to login_path and return
    rescue
      flash[:notice] = "Sorry, this user-id is taken. Try again."
      redirect_to new_user_path and return
    end
  end

end