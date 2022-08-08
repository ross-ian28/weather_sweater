class Munchie
  attr_reader :name, :location

  def initialize(data)
    @name = data[:name]
    @location = data[:location][:display_address]
  end
end
