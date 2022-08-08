require 'rails_helper'

RSpec.describe MunchiesService do
  describe 'get_restaurant' do
    it 'returns food data' do
      food = MunchiesService.get_restaurant("Denver,CO", "chinese")

      expect(food[:businesses]).to be_an(Array)

      expect(food[:businesses][0]).to include :name, :location
      expect(food[:businesses][0][:location]).to include :display_address
      expect(food[:businesses][0][:name]).to eq("Taste of China")
      expect(food[:businesses][0][:location][:display_address]).to eq(["1935 Federal Blvd", "Denver, CO 80204"])
    end
  end
end
