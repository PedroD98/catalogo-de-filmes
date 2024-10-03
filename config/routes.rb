Rails.application.routes.draw do
  root to: "home#index"

  resources :genres
  resources :directors
  resources :movies do
    patch :publish, on: :member
    patch :withdraw_publication, on: :member
  end
end
