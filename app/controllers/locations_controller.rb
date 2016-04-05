class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def create
    @location = current_user.locations.build(location_params)
    if @location.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def location_params
    params.require(:location).permit(:street, :city, :state, :country)
  end
end
