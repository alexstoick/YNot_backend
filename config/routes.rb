YnotBackend::Application.routes.draw do

  resources :users, only: [:show, :create] do
    resources :questions, only: :create
  end

  resources :questions, only: [:show] do
    resources :answers, only: :create
    match "sent", to: "questions#sent", via: :get
  end

  resource :answers, only: :index
end
