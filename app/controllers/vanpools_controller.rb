class VanpoolsController < ApplicationController
  before_action :set_current_user

  def vanpool_params
    params.require(:vanpool).permit(:name, :cost, :max_capacity, :current_capacity, :start_time, :end_time, :pickup_location, :dropoff_location)
  end

  def index
    @vanpools = Vanpool.all
  end

  def new
  end

  def create
    v_name = vanpool_params[:name]
    v_cost = vanpool_params[:cost]
    v_max_capacity = vanpool_params[:max_capacity]
    v_start_time = vanpool_params[:start_time]
    v_end_time = vanpool_params[:end_time]
    v_pickup_location = vanpool_params[:pickup_location]
    v_dropoff_location = vanpool_params[:dropoff_location]
    v_current_capacity = 0

    flash[:notice] = "Vanpool #{v_name} successfully created"
    Vanpool.create!(name: v_name,
                    cost: v_cost,
                    current_capacity: v_current_capacity,
                    max_capacity: v_max_capacity,
                    start_time: v_start_time,
                    end_time: v_end_time,
                    pickup_location: v_pickup_location,
                    dropoff_location: v_dropoff_location)
    redirect_to vanpools_index_path
  end

  def join
    user = User.where(session_token: session[:session_token])
    user = user[0]
    rider_vanpool_ids = user[:rider_vanpool_ids]
    driver_vanpool_ids = user[:driver_vanpool_ids]
    #begin
      # Join Ride
      params[:vanpools].keys.each do |v_id|
        v_id = v_id.to_i
        bool = rider_vanpool_ids.any? do |u_v_id|
          u_v_id == v_id
        end
        if !bool
          user[:rider_vanpool_ids] << v_id
          vanpool = Vanpool.find_by(id: v_id)
          vanpool.current_capacity = vanpool.current_capacity + 1
          vanpool.save
          user.save
        end
      end

      # Volunteer to Drive
      params[:vanpools_driver].keys.each do |v_id|
        v_id = v_id.to_i
        bool = driver_vanpool_ids.any? do |u_v_id|
          u_v_id == v_id
        end
        if !bool
          user[:driver_vanpool_ids] << v_id
          vanpool = Vanpool.find_by(id: v_id)
          vanpool.driver = user.id
          vanpool.save
          user.save
        end

      end
    #rescue
    # flash[:notice] = "No Vanpool(s) Selected"
    # redirect_to vanpools_index_path and return
    #end
    flash[:notice] = "Vanpool(s) Successfully added"
    redirect_to pages_welcome_path
  end
end