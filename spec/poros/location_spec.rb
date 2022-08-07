require 'rails_helper'

RSpec.describe Location do
  it 'populates location fields from JSON response' do
    data = {:lat=>43.84861, :lng=>-96.2252}

    cords = Location.new(data)

    expect(cords).to be_a Location

    expect(cords.lat).to eq(data[:lat])
    expect(cords.lng).to eq(data[:lng])
  end
end
