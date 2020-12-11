class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:user_id, :email, :session_token, :password, :driver, :rider)
  end

  def new
    # default: render 'new' template
  end

  def create
    user_id = user_params["user_id"]
    email = user_params["email"]
    if (user_id != '' && User.find_by(user_id: user_id).nil?) && email != '' && User.find_by(email: email).nil?
      driver=false
      rider=false
      admin=false
      if params[:role] == "driver"
        driver=true
      elsif params[:role] == "rider"
        rider=true
      end
      session_token = SecureRandom.base64
      user = {user_id: user_id, email: email, session_token: session_token, password: user_params["password"], driver: driver, rider: rider, admin: admin, approved: false}
      @user = User.create!(user)
      flash[:notice] = "Welcome. Your account has been created."
      redirect_to login_path
    else
      if user_id == ''
        flash[:notice]= "Sorry. User-ID cannot be empty."
        redirect_to new_user_path
      elsif !User.find_by(user_id: user_id).nil?
        flash[:notice] = "Sorry. This user-id is taken. Try again."
        redirect_to new_user_path
      elsif email == ''
        flash[:notice]= "Sorry. Email cannot be empty."
        redirect_to new_user_path
      elsif !User.find_by(email: email).nil?
        flash[:notice] = "Sorry. This email is taken. Try again."
        redirect_to new_user_path
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "The user: '#{@user.user_id}' has been removed from the database."
    redirect_to root_path
  end

end