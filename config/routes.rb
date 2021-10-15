Rails.application.routes.draw do
  root to: 'reservations#index'
  namespace :api do
    resources :guests, defaults: {format: 'json'}
    resources :reservations, defaults: {format: 'json'}
  end
end
