QuizSite::Application.routes.draw do


  # Quizzes and associated models.

  resources :quizzes do
    resources :questions do
      resources :possible_answers
      resources :responses
    end
  end


  # Authentication.

  resources :users
  resources :identities, only: [:new, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: 'sessions#failure'

  get 'signup', to: 'identities#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'signup/post-quiz', to: 'sessions#assign_to_user', as: 'assign_session_to_user'

  
  # Singular pages

  root to: 'site#index'
  get 'leaderboard', to: 'leaderboard#index'


  # Utility routes.

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config


end
