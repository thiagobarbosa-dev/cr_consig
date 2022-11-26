Rails.application.routes.draw do
  resources :customers do
    collection do
      get :states
      get :cities
    end
  end
  devise_scope :user do
    authenticated :user do
      root 'dashboard#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  devise_for :users
  resources :users

  get 'users/index'

  # get "dashboard/index"
  root to: 'dashboard#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
