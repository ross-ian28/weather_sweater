class Destination
  attr_reader :travel_time

  def initialize(data)
    @travel_time = "#{data[:route][:realTime] / 3600} hours, #{(data[:route][:realTime] % 3600) / 60} minutes"
  end
end
