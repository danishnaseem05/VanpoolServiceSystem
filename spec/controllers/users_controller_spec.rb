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
      expect(flash[:notice].include?('Welcome. Your account has been created.')).to be_truthy
    end

    it 'Should go to login page if logging out' do
      test_params = { user: { password: 'testpass1',
                              email: 'me@you.com' } }
      post :create, params: test_params
      expect(session[:session_token]).to be_nil
    end

    it 'should display what type of user you are' do
      test_params = { user: { user_id: 'user08', password: 'test123',
                              email: 'user01@test.com', admin: true} }
      post :create, params: test_params
      expect(response).to have_content('#')
    end
  end
end
