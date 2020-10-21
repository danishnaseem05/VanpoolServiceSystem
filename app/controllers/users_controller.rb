class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:user_id, :email, :session_token, :password)
  end

  def new
    # default: render 'new' template
  end



  def create
    user_id = user_params["user_id"]
    if user_id != '' && User.find_by(user_id: user_id).nil?
      #   usr = User.new
      session_token = SecureRandom.base64
      user = {user_id: user_id, email: user_params["email"], session_token: session_token, password: user_params["password"]}
      @user = User.create!(user)
      #@user = create_user!(user_id: user_id, email: user_params["email"], password: user_params["password"])
      flash[:notice] = "Welcome #{@user.user_id}. Your account has been created."
      redirect_to login_path
    else
      if user_id == ''
        flash[:notice]= "Sorry. User-ID cannot be empty."
        redirect_to new_user_path
      else
        flash[:notice] = "Sorry. This user-id is taken. Try again."
        redirect_to new_user_path
      end
    end
    #  begin
    # @user = User.create_user!(user_params)
    # flash[:notice] = "Welcome #{@user.user_id}. Your account has been created."
    # redirect_to login_path and return
    #rescue
    # flash[:notice] = "Sorry, this user-id is taken. Try again."
    # redirect_to new_user_path and return
    #end
  end



end