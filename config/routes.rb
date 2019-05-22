Rails.application.routes.draw do

  root 'questions#index'
  #resources :questions, only: :destroy

  resources :tests do
    resources :questions
  end

  resources :questions

end
