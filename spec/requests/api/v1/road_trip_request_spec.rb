require "rails_helper"

RSpec.describe "weather api" do
  xit "returns forcast data for a location" do
    user = User.create(email: "pabu@example.com", password: "pabu123", password_confirmation: "pabu123", api_key: "abcde12345")
    params = {
      origin: "Denver,CO",
      destination: "Pueblo,CO",
      api_key: "abcde12345"
    }
    headers = { "Content-Type" => "application/json" }

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(params)

    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    binding.pry
  end
  describe "sad path" do
    it "needs an api key" do
      user = User.create(email: "pabu@example.com", password: "pabu123", password_confirmation: "pabu123", api_key: "abcde12345")
      params = {
        origin: "Denver,CO",
        destination: "Pueblo,CO",
      }
      headers = { "Content-Type" => "application/json" }

      post "/api/v1/road_trip", headers: headers, params: JSON.generate(params)

      expect(response).to_not be_successful
      expect(response.body).to eq("Api key required")
    end
  end
end
