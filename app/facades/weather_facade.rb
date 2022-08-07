class WeatherFacade
  def self.weather(lat, lng)
    data = WeatherService.get_weather(lat, lng)
    Forcast.new(data)
  end
end
