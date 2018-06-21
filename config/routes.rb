Rails.application.routes.draw do
  namespace :admin do
      resources :events
      resources :parties
      resources :politicians
      resources :subordinates

      root to: "events#index"
    end
  root to: 'parties#index'

  resources :politicians, only: [:show]
  resources :subordinates, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
