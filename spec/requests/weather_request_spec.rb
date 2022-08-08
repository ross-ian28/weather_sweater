require "rails_helper"

RSpec.describe "weather api" do
  it "returns forcast data for a location" do
    get "/api/v1/forecast?location=Denver,CO"

    weather = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(response).to be_successful

    expect(weather).to include :id, :type, :attributes
    expect(weather[:id]).to eq(nil)
    expect(weather[:type]).to eq("forcast")

    expect(weather[:attributes]).to include :current_weather, :daily_weather, :hourly_weather
    expect(weather[:attributes][:daily_weather]).to be_an(Array)
    expect(weather[:attributes][:hourly_weather]).to be_an(Array)

    expect(weather[:attributes][:current_weather]).to include :datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity,
    :uvi, :visibility, :conditions, :icon
    expect(weather[:attributes][:current_weather]).to_not include :pressure, :clouds, :wind_speed, :dew_point

    expect(weather[:attributes][:daily_weather].count).to eq(5)
    expect(weather[:attributes][:daily_weather][0]).to include :date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon
    expect(weather[:attributes][:daily_weather][0]).to_not include :moonrise, :pressure, :dew_point, :clouds, :uvi

    expect(weather[:attributes][:hourly_weather].count).to eq(8)
    expect(weather[:attributes][:hourly_weather][0]).to include :time, :temperature, :conditions, :icon
    expect(weather[:attributes][:hourly_weather][0]).to_not include :clouds, :humidity, :wind_speed, :wind_gust
  end
end
