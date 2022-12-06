Rails.application.routes.draw do
  devise_for :users
  root "room#home"
  resources :rooms
end