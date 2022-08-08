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
    new_user = User.last

    expect(response).to be_successful

    expect(user).to include :id, :type, :attributes
    expect(user[:id]).to eq(new_user.id)
    expect(user[:type]).to eq("users")
    expect(user[:attributes]).to include :email, :api_key
    expect(user[:attributes][:email]).to eq(new_user.email)
  end

  describe 'sad path' do
    before :each do
      params = {
        email: "loki@example.com",
        password: "pabu123",
        password_confirmation: "pabu123"
      }
      headers = { "Content-Type" => "application/json" }

      post "/api/v1/users", headers: headers, params: JSON.generate(params)
    end
    it "all fields are required" do
      params = {
        email: "",
        password: "pabu123",
        password_confirmation: "pabu123"
      }
      headers = { "Content-Type" => "application/json" }

      post "/api/v1/users", headers: headers, params: JSON.generate(params)

      expect(response).to_not be_successful
      expect(response.body).to eq("Email can't be blank")
    end

    it "passwords dont match" do
      params = {
        email: "pabu@example.com",
        password: "pabu123",
        password_confirmation: "pabu"
      }
      headers = { "Content-Type" => "application/json" }

      post "/api/v1/users", headers: headers, params: JSON.generate(params)

      expect(response).to_not be_successful
      expect(response.body).to eq("Password confirmation doesn't match Password")
    end

    it "email is taken" do
      params = {
        email: "loki@example.com",
        password: "pabu123",
        password_confirmation: "pabu123"
      }
      headers = { "Content-Type" => "application/json" }

      post "/api/v1/users", headers: headers, params: JSON.generate(params)

      expect(response).to_not be_successful
      expect(response.body).to eq("Email has already been taken")
    end
  end
end
