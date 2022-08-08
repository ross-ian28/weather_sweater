require "rails_helper"

RSpec.describe "login endpoint" do
  it "logs in a user" do
    user = User.create(email: "pabu@example.com", password: "pabu123", password_confirmation: "pabu123", api_key: "abcde12345")

    params = {
      email: "pabu@example.com",
      password: "pabu123",
    }
    headers = { "Content-Type" => "application/json" }

    post "/api/v1/sessions", headers: headers, params: JSON.generate(params)

    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful

    expect(data).to include :id, :type, :attributes
    expect(data[:id]).to eq(user.id)
    expect(data[:type]).to eq("users")
    expect(data[:attributes]).to include :email, :api_key
    expect(data[:attributes][:email]).to eq(user.email)
    expect(data[:attributes][:api_key]).to eq(user.api_key)
  end
end
