Rails.application.routes.draw do

  get 'sessions/new'
  get 'users/new'
  root 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  get :logout, to: 'sessions#out'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true
    end
  end

  resources :questions

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

end
