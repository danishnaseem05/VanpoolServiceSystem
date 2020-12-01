require 'spec_helper'
require 'rails_helper'

RSpec.describe UsersController do
  describe 'Creating User'  do
    it 'Should create a new account if provided valid info' do
      # Valid
      test_params = { user: { user_id: 'user01', password: 'test123',
                          email: 'user01@test.com', admin: true} }
      post :create, params: test_params
      expect(response).to redirect_to(login_path)
    end
  end
end
