class Api::V1::RoadTripController < ApplicationController
  def index
    if params[:api_key] != nil
      trip = RoadTripFacade.trip(params[:origin], params[:destination])
      RoadTripSerializer.get_trip(params[:origin], params[:destination], trip)
    else
      render json: 'Api key required', status: 401
    end
  end
end
