class Api::V1::RoadTripController < ApplicationController
  def index
    if User.find_by(api_key: params[:api_key])
      trip = RoadTripFacade.trip(params[:origin], params[:destination])
      if trip.error != nil || trip.seconds >= 10000000
        render json: RoadTripSerializer.bad_trip(params[:origin], params[:destination])
      else
        cords = GeocodeFacade.cords(params[:location])
        weather = WeatherFacade.future_weather(cords[0].lat, cords[0].lng, trip.hour)

        render json: RoadTripSerializer.get_trip(params[:origin], params[:destination], trip, weather)
      end
    else
      render json: 'Unauthorized', status: 401
    end
  end
end
