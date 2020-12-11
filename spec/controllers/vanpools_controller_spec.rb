require 'rails_helper'
require 'spec_helper'

describe VanpoolsController do

  describe 'creating a new vanpool' do
    it 'Should create a new vanpool if provided valid info' do
      test_params = { vanpool: { name: 'Church', cost: "3", current_capacity: "0", max_capacity: "3", pickup_location: "Neighborhood" } }
      post :create, params: test_params
      expect(response.status).to eq(302)
     #include?('Your account was successfully created.')).to be_truthy
    end
    it 'Should create a new vanpool if provided valid info' do
      test_params = { vanpool: { name: 'Church', cost: "3", current_capacity: "0", max_capacity: "3", pickup_location: "Neighborhood" } }
      post :create, params: test_params
      expect(flash[:notice]).to be_present
    end

    describe 'joining a vanpool' do
      it 'should add vanpool to users rider_vanpool_ids' do
       test_params = { vanpool: { name: 'Church', cost: "3", current_capacity: "0", max_capacity: "3", pickup_location: "Neighborhood" } }
        expect(flash[:notice]).not_to be_present
      end
      it 'should redirect when clicking show all vanpool' do
        test_params = { vanpool: { name: 'Church', cost: "3", current_capacity: "0", max_capacity: "3", pickup_location: "Neighborhood" } }
        post :index, params: test_params
        expect(response.status).to eq(200)
      end
      it 'should display all vanpools' do
        test_params = { vanpool: { name: 'Church', cost: "3", current_capacity: "0", max_capacity: "3", pickup_location: "Neighborhood" } }
        post :index, params: test_params
      end

    end
  end
end
