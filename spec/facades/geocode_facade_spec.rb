require 'rails_helper'

RSpec.describe GeocodeFacade do
  describe 'get cords' do
    it 'maps a response from the GeocodeService' do
      cords = GeocodeFacade.cords("Denver,CO")

      expect(cords).to be_an Array

      expect(cords[0].lat).to be_a(Float)
      expect(cords[0].lng).to be_a(Float)
    end
  end
end
