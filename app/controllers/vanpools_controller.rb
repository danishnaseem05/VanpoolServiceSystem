class VanpoolsController < ApplicationController
  before_action :set_current_user

  def vanpool_params
    params.require(:vanpool).permit(:name, :cost, :max_capacity, :start_time, :end_time, :pickup_location, :dropoff_location)
  end

  def index
    @vanpools = Vanpool.all
  end

  def new
  end

  def create
    v_name = vanpool_params[:name]
    flash[:notice] = "Vanpool #{v_name} successfully created"
    Vanpool.create!(vanpool_params)
    redirect_to vanpools_index_path
  end

end