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

  def self.find_closest
    service.closest_stations["fuel_stations"].map do |station|
      _build_object(station)
    end
  end

  def self.find_closest_to_route
    service.routed_stations["fuel_stations"].map do |station|
      _build_object(station)
    end
  end

  def self._build_object(data)
    OpenStruct.new(data)
  end

end
