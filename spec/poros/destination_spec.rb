require 'rails_helper'

RSpec.describe Destination do
  it 'populates destination fields from JSON response' do
    data =  {:route=>
      {:realTime=>5347,
     }
   }


    trip = Destination.new(data)

    expect(trip).to be_a Destination

    expect(trip.travel_time).to eq("#{data[:route][:realTime] / 3600} hours, #{(data[:route][:realTime] % 3600) / 60} minutes")
  end
end
