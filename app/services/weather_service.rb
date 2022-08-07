class WeatherService
  def self.conn
    Faraday.new("https://api.openweathermap.org")
  end

  def self.api_key
    ENV["weather_api_key"]
  end

  def self.get_weather(lat, lon)
    response = conn.get("/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=minutely,alerts&units=imperial&appid=#{api_key}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
