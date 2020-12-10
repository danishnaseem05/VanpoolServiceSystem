require 'spec_helper'
require 'rails_helper'

RSpec.describe UsersController do
  describe 'Creating User'  do
    it 'Should redirect to login path if provided valid info' do
      test_params = { user: { user_id: 'user01', password: 'test123',
                          email: 'user01@test.com', admin: true} }
      post :create, params: test_params
      expect(response).to redirect_to(login_path)
    end

    it 'Should display flash describing success if provided valid info' do
      test_params = { user: { user_id: 'kev', password: 'asdf123', password_confirmation: 'asdf123',
                              email: 'me@google.com', email_confirmation: 'me@google.com' } }
      post :create, params: test_params
      expect(flash[:notice].include?('Welcome kev. Your account has been created.')).to be_truthy

    end
  end
end
