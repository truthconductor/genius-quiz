Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'quizzes#index'
  resources :quizzes do
    resources :questions, only: [:show] do
      member do
        post :answer
        get :result
      end
    end
  end
  resources :users, only: [:show]
end
