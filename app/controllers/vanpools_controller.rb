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

  #TODO make rider and driver join seperately
  def join
    # If redirect_to_welcome is false, then redirect_to vanpools_index_path;
    # Otherwise, redirect_to pages_welcome_path, both with the output_msg inside flash[:notice]
    output_msg = " "
    redirect_to_welcome = false

    vanpool_ids = @current_user[:rider_vanpool_ids]
    if @current_user.nil?
      flash[:notice] = "user is nil"
      redirect_to pages_welcome_path and return
    end
    if vanpool_ids.nil?
      flash[:notice] = "47 vanpool_ids is nil", @current_user
      redirect_to pages_welcome_path and return
    end

    # Rider
    if !params[:vanpools].nil?
      params[:vanpools].keys.each do |vid|
        vid = vid.to_i
        added = false
        if vanpool_ids.nil?
          flash[:notice] = "57 vanpool_ids is nil"
          redirect_to pages_welcome_path and return
        end
        vanpool_ids.each do |id|
          if id == vid
            added = true
          end
        end
        if !added
          @current_user.rider_vanpool_ids_will_change!
          @current_user.rider_vanpool_ids << vid
          vanpool = Vanpool.find_by(id: vid)
          vanpool.current_capacity = vanpool.current_capacity + 1
          vanpool.save
          @current_user.save
        end
      end
      output_msg = output_msg + "#{@current_user.user_id}, you successfully joined the vanpool(s). "
      redirect_to_welcome = true
    elsif params[:vanpools].nil?
      output_msg = output_msg + "No vanpool selected to ride "
    end

    # Driver
    driver_vanpool_ids = @current_user[:driver_vanpool_ids]
    if !params[:vanpools_driver].nil?
      params[:vanpools_driver].keys.each do |vid|
        vid = vid.to_i
        added = false
        if driver_vanpool_ids.nil?
          flash[:notice] = "57 vanpool_ids is nil"
          redirect_to pages_welcome_path and return
        end
        vanpool = Vanpool.find_by(id: vid)
        driver_vanpool_ids.each do |id|
          if id == vid || !vanpool.driver.nil?
            added = true
          end
        end
        if !added
          @current_user.driver_vanpool_ids_will_change!
          @current_user.driver_vanpool_ids << vid
          vanpool.driver = @current_user.id
          vanpool.save
          @current_user.save
        end
      end

      output_msg = output_msg + "AND Volunteer to Drive Selected"
      redirect_to_welcome = true
    elsif params[:vanpools_driver].nil?
      output_msg = output_msg + "AND No vanpool selected to volunteer to drive"
    end

    flash[:notice] = output_msg
    if redirect_to_welcome
      redirect_to pages_welcome_path
    else
      redirect_to vanpools_index_path
    end
  end
end