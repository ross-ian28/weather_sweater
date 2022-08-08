require "rails_helper"

RSpec.describe "user creation api" do
  it "returns user creation information" do
    params = {
      email: "pabu@example.com",
      password: "pabu123",
      password_confirmation: "pabu123"
    }
    headers = { "Content-Type" => "application/json" }

    post "/api/v1/users", headers: headers, params: JSON.generate(params)

    user = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    binding.pry
    expect(user).to include :id, :type, :attributes
    expect(weather[:id]).to eq(user.id)
    expect(weather[:type]).to eq("users")
    expect(weather[:attributes]).to include :email, :api_key
    expect(weather[:attributes][:email]).to eq(user.email)
  end
end
