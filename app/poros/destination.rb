class Destination
  attr_reader :travel_time, :hour, :error, :seconds

  def initialize(data)
    if data[:info][:messages] == ["We are unable to route with the given locations."]
      @error = "error"
    else
      @seconds = data[:route][:legs][0][:time]
      @hour = data[:route][:legs][0][:time] / 3600
      @travel_time = "#{data[:route][:legs][0][:time] / 3600} hours, #{(data[:route][:legs][0][:time] % 3600) / 60} minutes"
    end
  end
end
