Rails.application.routes.draw do
  devise_for :users 
  root to: 'home#index'
  resources :guesthouses, only: [:show, :new, :create, :edit, :update]
  resources :rooms, only: [:show, :new, :create, :edit, :update]
  
end