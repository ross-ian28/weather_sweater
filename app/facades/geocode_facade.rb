class GeocodeFacade
  def self.cords(location)
    GeocodeService.get_cords(location)[:results].map do |data|
      Location.new(data[:locations][0][:latLng])
    end
  end
end
