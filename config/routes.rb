Rails.application.routes.draw do
  resources :attendings
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]
  resources :events
  resources :attendings, only: [:create, :delete]
  root "events#index"
end
