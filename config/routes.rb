Rails.application.routes.draw do
  resources :budgets do
    resources :budget_products, except: [:index, :show]
  end
  resources :offers do
    resources :offer_products, except: [:index, :show]
  end

  resources :shipping_types
  resources :products
  resources :customers do
    collection do
      get :states
      get :cities
    end
  end

  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'dashboard#index', as: :authenticated_root
      get '/users/sign_out' => 'devise/sessions#destroy'
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  resources :users do
    get 'show', to: 'users#show', as: 'show'
  end  

  root to: 'dashboard#index'

  # get "dashboard/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
