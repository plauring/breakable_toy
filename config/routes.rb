Rails.application.routes.draw do
  root 'events#index'

  devise_for :users


  resources :users, only: [:index, :show] do
    resources :favorite_teams, only: [:index, :new, :create]
  end

  resources :events, only: [:new, :index, :new, :create, :show] do
    resources :memberships, only: [:index, :new, :create]
  end

  resources :teams, only: [:index, :create]

end
