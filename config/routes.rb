Rails.application.routes.draw do

  root 'tests#index'

  resources :tests do
    resources :questions
  end

  resources :questions

end
