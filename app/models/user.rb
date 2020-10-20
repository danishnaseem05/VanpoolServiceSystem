class User < ActiveRecord::Base
  validates :user_id, uniqueness: true
  validates :email, uniqueness: true

  def User::create_user! (params)
    session_token = SecureRandom.base64
    params[:session_token] = session_token
    User.create!(params)
  end

end