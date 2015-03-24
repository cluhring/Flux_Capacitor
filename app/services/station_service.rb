class StationService
  attr_reader :connection

  def initialize
    # @connection = Faraday.new(url: "http://developer.nrel.gov/api/alt-fuel-stations/v1.json?api_key=NrcHZRCeouPvntxWjoqLW5IppXF4LwiDQLySiVMD&status=E&access=public&limit=200")
    @connection = Faraday.new(url: "http://developer.nrel.gov/api/alt-fuel-stations/v1")
  end

  def stations
    parse(connection.get do |req|
      req.params['api_key'] = ENV['nrel_secret']
      req.params['format'] = 'json'
      req.params['status'] = 'E'
      req.params['access'] = 'public'
      req.params['limit'] = 200
      # req.params['state'] = 'CO'
    end)
  end

  # /api/alt-fuel-stations/v1/39534.json?api_key=DEMO_KEY
  def station(id)
    parse(connection.get("/api/alt-fuel-stations/v1/#{id}") do |req|
      req.params['api_key'] = ENV['nrel_secret']
      req.params['format'] = 'json'
    end)
  end

  def closest_stations
    parse(connection.get("/api/alt-fuel-stations/v1/nearest.json?") do |req|
      req.params['api_key'] = ENV['nrel_secret']
      req.params['status'] = 'E'
      # req.params['latitude'] = session[:latitude]
      # req.params['longitude'] = session[:longitude]
      req.params['latitude'] = 39.749747
      req.params['longitude'] = -104.999977
      req.params['radius'] = 5
      req.params['limit'] = 4
    end)
  end

  def routed_stations
    parse(connection.get("/api/alt-fuel-stations/v1/nearby-route.json?") do |req|
      req.params['api_key'] = ENV['nrel_secret']
      req.params['status'] = 'E'
      req.params['route'] = 'LINESTRING(-104.999977 39.749747 , -87.63 41.87)' #(Turing, Chicago)
      req.params['distance'] = 5 #(Distance from route)
    end)
  end

  private

  def parse(response)
    JSON.parse(response.body)
  end

end
