Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#index'

  resources :clients do
    resources :entreprises
    resources :immobiliers
  end

  resources :cgps, only: [:show, :index] do
    resources :clients do
      resources :entreprises do
        resources :immobiliers
      end
    end
  end
  resources :entreprises do
    resources :immobiliers
  end
  resources :filiales do
    resources :immobiliers, only: [:destroy]
  end



end
