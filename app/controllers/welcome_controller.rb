class WelcomeController < ApplicationController
  def index
  end

  def create
    # require 'pry' ; binding.pry
    @location = Location.create(address: params[:address])
    session[:latitude1] = @location.latitude
    session[:longitude1] = @location.longitude
    redirect_to stations_path
  # session[:latitude] = params[:latitude]
  # session[:longitude] = params[:longitude]
  end

end
