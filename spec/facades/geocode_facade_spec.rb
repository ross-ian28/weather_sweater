require 'rails_helper'

RSpec.describe GeocodeFacade do
  describe 'get cords' do
    it 'maps a response from the GeocodeService' do
      cords = GeocodeFacade.cords("Denver,CO")

      expect(cords).to be_an Array

      expect(cords[0].lat).to eq(43.84861)
      expect(cords[0].lng).to eq(-96.2252)
    end
  end
end
