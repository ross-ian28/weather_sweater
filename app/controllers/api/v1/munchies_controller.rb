class Api::V1::MunchiesController < ApplicationController
  def index
    cords = GeocodeFacade.cords(params[:location])
    weather = WeatherFacade.weather(cords[0].lat, cords[0].lng)

    restaurant = MunchiesFacade.restaurant(params[:location], params[:food])

    render json: MunchiesSerializer.get_data(params[:location], weather, restaurant)
  end
end
