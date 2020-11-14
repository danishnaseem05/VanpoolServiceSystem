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
      if @user.driver || @user.rider
        redirect_to pages_welcome_path
      else
        redirect_to root_path
      end
    end
  end

  def destroy
    @_request.reset_session
    flash[:notice] = "You have successfully been logged out"
    redirect_to root_path
  end

end
