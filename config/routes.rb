Rails.application.routes.draw do
  resources :temperature_readings
  resources :users
  resources :gears
  draw(:api_v1)
end
