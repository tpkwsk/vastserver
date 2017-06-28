Rails.application.routes.draw do
#   root
  root to: 'toppages#index'
  
#   campaigns
  resources :campaigns
end
