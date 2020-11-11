class VanpoolsController < ApplicationController
  before_action :set_current_user

  def index
  end

  def new
  end

  def create
    redirect_to vanpools_index_path
  end

end