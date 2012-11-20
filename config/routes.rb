QuizSite::Application.routes.draw do

  resources :quizzes do
    resources :questions do
      resources :possible_answers
      resources :responses
    end
  end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'site#index'

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

end
