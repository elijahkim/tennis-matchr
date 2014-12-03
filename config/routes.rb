require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, except: [:destroy] do
    resources :match_requests, only: [:new, :create]
  end
  resources :match_requests, only: [:show] do
    resource :accept, only: [:create]
    resources :comments, only: [:create, :destroy, :edit, :update]
  end

  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  constraints Monban::Constraints::SignedOut.new do
    root "sessions#new"
  end
end
