Rails.application.routes.draw do
  root 'events#index'

  devise_for :users

  resources :users, only: [:index, :show]

  resources :events, only: [:new, :index, :new, :create, :show] do
    resources :memberships, only: [:index, :new, :create]
  end

  resources :teams, only: [:create]

end
