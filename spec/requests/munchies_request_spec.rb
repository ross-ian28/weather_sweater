require "rails_helper"

RSpec.describe "munchies api" do
  it "returns data for resturaunt and weather" do
    get "/api/v1/munchies?location=denver,co&food=chinese"

    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful

    expect(data).to include :id, :type, :attributes
    expect(data[:id]).to eq(nil)
    expect(data[:type]).to eq("munchie")
    expect(data[:attributes]).to include :destination_city, :forecast, :restaurant
    expect(data[:attributes][:forecast]).to include :summary, :temperature
    expect(data[:attributes][:restaurant]).to include :name, :address
  end
end
