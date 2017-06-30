Rails.application.routes.draw do
#   root
  root to: 'toppages#index'
  
  # campaigns
  resources :campaigns, only: [:index, :new, :create, :edit, :update, :destroy]
  
  # cuepoints
  resources :cuepoints, only: [:index, :new, :create, :edit, :update, :destroy]
end
