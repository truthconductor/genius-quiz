Rails.application.routes.draw do
  get 'questions_controller/show'
  devise_for :users
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
end
