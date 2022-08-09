class RoadTripSerializer
  def self.get_trip(origin, destination, trip, weather)
    {
      data: {
        id: nil,
        type: "roadtrip",
        attributes: {
          start_city: origin,
          end_city: destination,
          travel_time: trip.travel_time,
          weather_at_eta: {
            temperature: weather.temp,
            conditions: weather.conditions
          }
        }
      }
    }
  end

  def self.bad_trip(origin, destination)
    {
      data: {
        id: nil,
        type: "roadtrip",
        attributes: {
          start_city: origin,
          end_city: destination,
          travel_time: "impossible",
          weather_at_eta: {
            temperature: "",
            conditions: ""
          }
        }
      }
    }
  end
end
