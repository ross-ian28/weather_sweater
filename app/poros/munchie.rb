class Munchie
  attr_reader :name, :location

  def initialize(data)
    @name = data[:name]
    @location = "#{data[:location][:display_address][0]}, #{data[:location][:display_address][1]}"
  end
end
