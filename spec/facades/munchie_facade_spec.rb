require 'rails_helper'

RSpec.describe MunchiesFacade do
  describe 'get food data' do
    it 'takes the first resturaunt found' do
      food = MunchiesFacade.restaurant("Denver,co", "chinese")

      expect(food).to be_a(Munchie)

      expect(food.name).to eq("Taste of China")
      expect(food.location).to eq("1935 Federal Blvd, Denver, CO 80204")
    end
  end
end
