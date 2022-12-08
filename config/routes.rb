Rails.application.routes.draw do
  devise_for :users
  resources :room
  root "room#index"
end
