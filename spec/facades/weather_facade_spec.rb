require 'rails_helper'

RSpec.describe WeatherFacade do
  describe 'get weather' do
    it 'creates a forcast poro' do
      weather = WeatherFacade.weather("43.84861", "-96.2252")

      expect(weather.current).to_not be_an Array
      expect(weather.daily).to be_an Array
      expect(weather.hourly).to be_an Array
    end
  end
end
