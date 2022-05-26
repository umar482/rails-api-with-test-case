namespace :api do
  namespace :v1, defaults: { format: :json } do
    get :status, to: 'api#status'
    resources :users
    resources :gears
    resources :temperature_readings
  end
end
