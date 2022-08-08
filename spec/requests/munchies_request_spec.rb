require "rails_helper"

RSpec.describe "munchies api" do
  it "returns data for resturaunt and weather" do
    get "/api/v1/munchies?location=denver,co&food=chinese"

    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful

    expect(weather).to include :id, :type, :attributes
    expect(weather[:id]).to eq(nil)
    expect(weather[:type]).to eq("munchie")
    expect(weather[:attributes]).to include :destination_city, :forcast, :restaurant
    expect(weather[:attributes][:forecast]).to include :summary, :temperature
    expect(weather[:attributes][:restaurant]).to include :name, :address
  end
end
