class Api::V1::WeatherController < ApplicationController
  def index
    cords = GeocodeFacade.cords(params[:location])
    weather = WeatherFacade.weather(cords[0].lat, cords[0].lng)
    render json: ForcastSerializer.get_forcast(weather)
  end
end
