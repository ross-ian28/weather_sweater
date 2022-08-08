Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/forecast", to: "weather#index"
      post "/users", to: "users#new"
    end
  end
end
