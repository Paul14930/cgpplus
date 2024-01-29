Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#index'

  resources :clients do
    resources :entreprises
  end

  resources :cgps, only: [:show, :index] do
    resources :clients do
    resources :entreprises
  end
  end


end
