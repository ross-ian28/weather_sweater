require 'rails_helper'

RSpec.describe RoadTripFacade do
  describe 'get travel time' do
    it 'maps a response from the RoadTripService', :vcr do
      trip = RoadTripFacade.trip("Denver,CO", "Estes Park, CO")

      expect(trip).to be_a(Destination)

      expect(trip.travel_time).to be_a(String)
    end
  end
end
