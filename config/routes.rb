Rails.application.routes.draw do
  resources :questionnaires
  resources :profiles
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
