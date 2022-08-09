require 'rails_helper'

RSpec.describe RoadTripService do
  describe 'get_trip' do
    it 'returns travel time' do
      trip = RoadTripService.get_trip("Denver,CO", "Estes Park, CO")

      expect(trip[:route]).to include :realTime
    end
  end
end
