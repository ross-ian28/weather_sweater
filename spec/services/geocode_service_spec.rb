require 'rails_helper'

RSpec.describe GeocodeService do
  describe 'get_cords' do
    it 'returns lat and long cords' do
      cords = GeocodeService.get_cords("Denver,CO")

      expect(cords[:results]).to be_an(Array)

      expect(cords[:results][0][:locations][0]).to include :street, :latLng
      expect(cords[:results][0][:locations][0][:latLng]).to eq({:lat=>43.84861, :lng=>-96.2252})
    end
  end
end
