class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def create
    @location = current_user.locations.build
    if @location.update(location_params)
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def location_params
    params.require(:location).permit(:street, :city, :state, :country, :is_private, friend_ids: [])
  end
end
