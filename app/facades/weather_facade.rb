class WeatherFacade
  def self.weather(lat, lng)
    data = WeatherService.get_weather(lat, lng)
    Forcast.new(data)
  end

  def self.future_weather(lat, lng, hour)
    if hour < 48
      data = WeatherService.get_weather(lat, lng)[:hourly][hour]
      FutureForecast.new(data)
    else
      data = WeatherService.get_weather(lat, lng)[:daily][hour/24]
      FutureForecast.new(data)
    end
  end
end
