Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: :gurus, path_names: {sign_up: :login, sing_out: :logout}

  get 'sessions/new'
  get 'users/new'
  get :logout, to: 'sessions#out'

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
