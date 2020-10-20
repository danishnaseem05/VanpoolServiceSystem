class SessionsController < ApplicationController

  def session_params
    params.require(:user).permit(:user_id, :email, :password)
  end

  def new
    # default: render 'new' template
  end

  def create
    user_id = session_params[:user_id]
    password = session_params[:password]

    if User.find_by(user_id: user_id).nil? || User.find_by(password: password).nil?
      flash[:notice] = "Invalid user-id/password combination"
      redirect_to login_path

    else
      @user = User.find_by(user_id: user_id)
      session[:session_token] = @user.session_token
      redirect_to login_path

    end

  end

  def destroy
    reset_session
    redirect_to login_path
  end

end