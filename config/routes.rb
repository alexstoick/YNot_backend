YnotBackend::Application.routes.draw do

  resources :users, only: [:show, :create] do
    resources :questions, only: :create
  end

  resources :questions, only: [] do
    resources :answers, only: :create
  end
end
