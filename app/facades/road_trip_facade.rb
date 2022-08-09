class RoadTripFacade
  def self.trip(origin, destination)
    data = RoadTripService.get_trip(origin, destination)
    Destination.new(data)
  end
end
