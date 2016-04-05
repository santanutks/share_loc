class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    respond_to do |format|
      format.html
      format.json { render json: @user.locations.not_private.long_lat_json }
    end
  end
end
