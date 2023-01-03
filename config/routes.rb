# frozen_string_literal: true

Rails.application.routes.draw do
  root "rooms#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users,
             controllers: { sessions: "users/sessions", omniauth_callbacks: "users/omniauth_callbacks",
                            passwords: "users/passwords", registrations: "users/registrations", confirmations: "users/confirmations", mailer: "users/mailer", unlocks: "users/unlocks" }
  resources :rooms do
    delete "/photos/:photo_id" => "rooms#destroy_photo", as: :destroy_photo, on: :member
    collection do
      get "manage"
      get "wish_list_rooms"
    end
    member do
      patch :wish_list
    end
  end

  resources :bookings, only: %i[create show new index]  do
    member do
      get "confirm"
      get "cancel"
      post "create_review"
    end
      collection do
      get 'ebpay'
      post 'ebpaid'
    end
  end
end

