Rails.application.routes.draw do
  resources :questionnaires
  resources :profiles do
    resources :reviews, only: %i[new create]
  end
  devise_for :users
  root to: "pages#home"

  resources :chatrooms, only: %i[show create new index] do
    resources :messages, only: :create
  end

  get 'dashboard', to: 'pages#dashboard'
end
