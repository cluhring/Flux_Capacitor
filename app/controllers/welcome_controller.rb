class WelcomeController < ApplicationController
  def index
  end

  def create
    @location = Location.create(address: params[:address])
    session[:latitude1] = @location.latitude || 39.749747
    session[:longitude1] = @location.longitude || -104.999977
    redirect_to stations_path
  end

end
