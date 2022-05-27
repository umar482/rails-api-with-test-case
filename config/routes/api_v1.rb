# frozen_string_literal: true

namespace :api do
  namespace :v1, defaults: { format: :json } do
    get :status, to: 'api#status'
    resources :users
    resources :gears, only: %i[update]
    resources :temperature_readings
  end
end
