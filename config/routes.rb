Rails.application.routes.draw do
  root to: 'parties#index'

  resources :politicians, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
