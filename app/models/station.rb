class Station < ActiveRecord::Base

  def self.service
    @service ||= StationService.new
  end

  def self.all
    service.stations["fuel_stations"].map do |station|
      _build_object(station)
    end
  end

  def self.find(id)
    _build_object(service.station(id))
  end

  def self.find_closest(lat, long)
    # require 'pry' ; binding.pry
    service.closest_stations(lat, long)["fuel_stations"].map do |station|
      _build_object(station)
    end
  end

  def self.find_closest_to_route(lat1, long1, lat2, long2)
    service.routed_stations(lat1, long1, lat2, long2)["fuel_stations"].map do |station|
      _build_object(station)
    end
  end

  def self._build_object(data)
    OpenStruct.new(data)
  end

end
