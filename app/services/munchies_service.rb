class MunchiesService
  def self.conn
    Faraday.new("https://api.yelp.com")
  end

  def self.get_restaurant(location, food)
    response = conn.get("/v3/businesses/search?location=#{location}&term=#{food}") do |req|
      req.headers["Authorization"] = ENV["munchies_api_key"]
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
