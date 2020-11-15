Rails.application.routes.draw do

  root to: 'dashboard#index'

  resources :dashboard, only: [:index]
  resources :appointments, only: [:index, :edit, :new, :create, :update, :destroy]
  resources :patients, only: [:index, :edit, :new, :create, :update, :destroy]
  resources :doctors, only: [:index, :edit, :new, :create, :update, :destroy]

end
