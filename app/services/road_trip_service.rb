class RoadTripService
  def self.conn
    Faraday.new("http://www.mapquestapi.com")
  end

  def self.api_key
    ENV["geocode_api_key"]
  end

  def self.get_trip(origin, destination)
    response = conn.get("/directions/v2/route?key=#{api_key}&from=#{origin}&to=#{destination}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
