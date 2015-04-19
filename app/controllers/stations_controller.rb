class StationsController < ApplicationController

  def index
  # @stations = Station.all
    @closest_stations_to_route = Station.find_closest_to_route(session[:latitude2], session[:longitude2], session[:latitude1], session[:longitude1])
    @closest_stations = Station.find_closest(session[:latitude2], session[:longitude2])
  end

  def show
    @station = Station.find(params[:id])
  end

  def create
    session[:latitude2] = params[:latitude1]
    session[:longitude2] = params[:longitude1]
    session[:latitude3] = params[:latitude2]
    session[:longitude3] = params[:longitude2]
    redirect_to stations_path
  end
end
