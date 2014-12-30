require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  resources :courts
  resources :match_requests, only: [:index, :show, :edit, :update, :destroy] do
    resource :accept, only: [:create]
    resources :comments, only: [:create, :destroy, :edit, :update]
  end
  resources :matches, only: [:show, :edit, :update, :index]
  resources :users, except: [:destroy] do
    resources :match_requests, only: [:new, :create]
  end

  resource :match_history, only: [:show]
  resource :activity_feeds, only: [:show]
  resource :search, only: [:show]
  resource :session, only: [:new, :create, :destroy]

  constraints Monban::Constraints::SignedIn.new do
    root "activity_feeds#show", as: :dashboard
  end

  constraints Monban::Constraints::SignedOut.new do
    root "pages#show", id: "index",  as: :root
  end

  get "pages/*id" => "pages#show", as: :page, format: false
end
