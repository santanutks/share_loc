class HomeController < ApplicationController
  def index
    @locations = current_user.accessible_locations
    respond_to do |format|
      format.html
      format.json { render json: @locations.long_lat_json }
    end
  end
end
