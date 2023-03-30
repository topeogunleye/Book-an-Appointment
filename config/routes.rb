# frozen_string_literal: true

Rails.application.routes.draw do
  root 'services#index'
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :services, only: %i[index show create destroy]
  resource :users, only: %i[index create]
  resources :reservation_users, only: %i[index create]
  resources :reservation, only: %i[index create]
  post '/login', to: 'auth#login'
  get '/auto_login', to: 'auth#auto_login'
  get '/user_is_authed', to: 'auth#user_is_authed'
end
