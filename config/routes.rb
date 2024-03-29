Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#index'

  resources :clients do
    resources :entreprises
    resources :immobiliers
    member do
      post :show, defaults: { format: :pdf }
    end
  end

  resources :cgps, only: [:show, :index] do
    resources :clients do
      post :show, on: :member, defaults: { format: :pdf }
      resources :entreprises do
        resources :immobiliers
      end
    end
  end

  resources :entreprises do
    member do
      get :cession
    end
    resources :immobiliers
  end

  resources :filiales do
    resources :immobiliers, only: [:destroy]
  end


end
