class Forcast
  attr_reader :current, :hourly, :daily

  def initialize(data)
    @current = data[:current]
    @hourly = data[:hourly]
    @daily = data[:daily]
  end
end
