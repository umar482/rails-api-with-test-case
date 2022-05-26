namespace :api do
  namespace :v1, defaults: { format: :json } do
    get :status, to: 'api#status'
    # resources :reservations #, only: %i[create, update]
  end
end
