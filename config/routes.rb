Rails.application.routes.draw do

  root 'questions#index'

  delete 'tests/:test_id/questions/:id', to: 'tests/questions/#destroy'

  resources :tests do
    resources :questions
  end
end
