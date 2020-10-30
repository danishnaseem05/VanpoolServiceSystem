class User < ActiveRecord::Base
  validates :user_id, uniqueness: true
  validates :email, uniqueness: true

  #def User::create_user! (params)
    #session_token = SecureRandom.base64
    #user = {user_id: user_id, email: email, session_token: session_token}
    #User.create!(user)
    # end
  def create_user!(user_id:, email:, password:)
    session_token = SecureRandom.base64
    user = {user_id: user_id, email: email, session_token: session_token, password: password}
    User.create!(user)
  end

  #  session_token = SecureRandom.base64
    #params[:session_token] = session_token
    #User.create!(params)


end