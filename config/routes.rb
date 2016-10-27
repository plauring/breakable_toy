Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"

  root 'events#index'

  devise_for :users


  resources :users, only: [:index, :show] do
    resources :favorites, only: [:index, :new, :create]
  end

  resources :events, only: [:index] do
    resources :memberships, only: [:index, :new, :create]
  end

  resources :teams, only: [:index]

  resources :games, only: [:index, :create] do
    resources :events, only: [:new, :create, :show]
  end
  post 'games/update_schedule' => 'games#update_schedule', as: :schedule
end
