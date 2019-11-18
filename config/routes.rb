# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path_names: {
    sign_in: 'login', sign_out: 'logout', sign_up: 'signup'
  }, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :users, only: %i[index show]
  resources :posts, only: %i[index create edit update destroy]
  resources :comments, only: %i[create destroy]
  resources :likes, only: %i[create destroy]
  resources :friendships, only: %i[create update destroy]

  get '/friends', to: 'friendships#index'
  get '/friend_requests', to: 'friendships#friend_requests'
  get '/mutual_friends', to: 'friendships#mutual_friends'

  unauthenticated do
    as :user do
      root to: 'devise/registrations#new'
    end
  end

  root to: 'posts#index'
end
