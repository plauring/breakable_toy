Rails.application.routes.draw do
  root 'events#index'

  devise_for :users


  resources :users, only: [:index, :show] do
    resources :favorites, only: [:index, :new, :create]
  end

  resources :events, only: [:index] do
    resources :memberships, only: [:index, :new, :create]
  end

  resources :teams, only: [:index, :create]

  resources :games, only: [:index, :create] do
    resources :events, only: [:new, :create, :show]
  end
end
