require "rails_helper"

RSpec.describe "weather api" do
  it "returns forcast data for Denver to Estes", :vcr do
    user = User.create(email: "pabu@example.com", password: "pabu123", password_confirmation: "pabu123", api_key: "abcde12345")
    params = {
      origin: "Denver, CO",
      destination: "Estes Park, CO",
      api_key: "abcde12345"
    }
    headers = { "Content-Type" => "application/json" }

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(params)

    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful

    expect(data).to include :id, :type, :attributes
    expect(data[:id]).to eq(nil)
    expect(data[:type]).to eq("roadtrip")

    expect(data[:attributes]).to include :start_city, :end_city, :travel_time, :weather_at_eta
    expect(data[:attributes][:travel_time]).to_not eq("impossible")

    expect(data[:attributes][:weather_at_eta]).to include :temperature, :conditions
    expect(data[:attributes][:weather_at_eta][:temperature]).to be_a(Float)
    expect(data[:attributes][:weather_at_eta][:conditions]).to_not eq("")
  end
  it "returns forcast data for NY to CA", :vcr do
    user = User.create(email: "pabu@example.com", password: "pabu123", password_confirmation: "pabu123", api_key: "abcde12345")
    params = {
      origin: "New York, NY",
      destination: "Los Angeles, CA",
      api_key: "abcde12345"
    }
    headers = { "Content-Type" => "application/json" }

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(params)

    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful

    expect(data[:attributes][:travel_time]).to_not eq("impossible")
    expect(data[:attributes][:weather_at_eta][:temperature]).to be_a(Float)
    expect(data[:attributes][:weather_at_eta][:conditions]).to_not eq("")
  end
  it "returns forcast data for NY to Panama", :vcr do
    user = User.create(email: "pabu@example.com", password: "pabu123", password_confirmation: "pabu123", api_key: "abcde12345")
    params = {
      origin: "New York, NY",
      destination: "Panama City, Panama",
      api_key: "abcde12345"
    }
    headers = { "Content-Type" => "application/json" }

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(params)

    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful

    expect(data[:attributes][:travel_time]).to_not eq("impossible")
    expect(data[:attributes][:weather_at_eta][:temperature]).to be_a(Float)
    expect(data[:attributes][:weather_at_eta][:conditions]).to_not eq("")
  end
  it "returns forcast data for NY to London", :vcr do
    user = User.create(email: "pabu@example.com", password: "pabu123", password_confirmation: "pabu123", api_key: "abcde12345")
    params = {
      origin: "New York, NY",
      destination: "London, UK",
      api_key: "abcde12345"
    }
    headers = { "Content-Type" => "application/json" }

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(params)

    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful

    expect(data[:attributes][:travel_time]).to eq("impossible")
    expect(data[:attributes][:weather_at_eta][:temperature]).to eq("")
    expect(data[:attributes][:weather_at_eta][:conditions]).to eq("")
  end
  describe "sad path" do
    it "needs an api key", :vcr do
      user = User.create(email: "pabu@example.com", password: "pabu123", password_confirmation: "pabu123", api_key: "abcde12345")
      params = {
        origin: "Denver,CO",
        destination: "Pueblo,CO"
      }
      headers = { "Content-Type" => "application/json" }

      post "/api/v1/road_trip", headers: headers, params: JSON.generate(params)

      expect(response).to_not be_successful
      expect(response.body).to eq("Unauthorized")
    end
    it "needs correct api key", :vcr do 
      user = User.create(email: "pabu@example.com", password: "pabu123", password_confirmation: "pabu123", api_key: "abcde12345")
      params = {
        origin: "Denver,CO",
        destination: "Pueblo,CO",
        api_key: "abcde"
      }
      headers = { "Content-Type" => "application/json" }

      post "/api/v1/road_trip", headers: headers, params: JSON.generate(params)

      expect(response).to_not be_successful
      expect(response.body).to eq("Unauthorized")
    end
  end
end
