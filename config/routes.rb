Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/forecast", to: "weather#index"
      get "/munchies", to: "munchies#index"
    end
  end
end
