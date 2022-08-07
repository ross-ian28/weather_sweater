require 'rails_helper'

RSpec.describe WeatherService do
  describe 'get_weather' do
    it 'returns weather info' do
      weather = WeatherService.get_weather("43.84861", "-96.2252")

      expect(weather[:current]).to include :dt, :sunrise, :sunset, :weather
      expect(weather[:current][:weather][0]).to include :description, :icon

      expect(weather[:hourly][0]).to include :dt, :temp, :feels_like, :weather
      expect(weather[:hourly][0][:weather][0]).to include :description, :icon

      expect(weather[:daily][0]).to include :dt, :temp, :feels_like, :weather
      expect(weather[:daily][0][:weather][0]).to include :description, :icon
    end
  end
end
