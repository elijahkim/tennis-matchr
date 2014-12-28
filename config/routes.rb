require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, except: [:destroy] do
    resources :match_requests, only: [:new, :create]
  end
  resources :match_requests, only: [:show, :edit, :update, :destroy] do
    resource :accept, only: [:create]
    resources :comments, only: [:create, :destroy, :edit, :update]
  end
  resources :matches, only: [:show, :edit, :update]
  resource :match_history, only: [:show]
  resource :activity_feeds, only: [:show]

  constraints Monban::Constraints::SignedIn.new do
    root "activity_feeds#show", as: :dashboard
  end

  constraints Monban::Constraints::SignedOut.new do
    root "pages#show", id: "index",  as: :root
  end

  get "pages/*id" => "pages#show", as: :page, format: false
end
