class MunchiesFacade
  def self.restaurant(location, food)
    data = MunchiesService.get_restaurant(location, food)[:businesses][0]
    Munchie.new(data)
  end
end
