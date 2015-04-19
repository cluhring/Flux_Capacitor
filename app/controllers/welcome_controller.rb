class WelcomeController < ApplicationController
  def index
  end

  def create
    @location = Location.create(address: params[:address])
    session[:latitude1] = @location.latitude
    session[:longitude1] = @location.longitude
    redirect_to stations_path
  end

end
