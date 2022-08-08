class MunchiesSerializer
  def self.get_data(location, weather, restaurant)
    {
      data: {
        id: nil,
        type: "munchie",
        attributes: {
          destination_city: location,
          forecast: {
            summary: weather.current[:weather][0][:description],
            temperature: weather.current[:temp]
          },
          restaurant: {
            name: restaurant.name,
            address: restaurant.location
          }
        }
      }
    }
  end
end
