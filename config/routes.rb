Rails.application.routes.draw do
  resources :questionnaires
  resources :profiles
  devise_for :users
  root to: "pages#home"

  resources :chatrooms, only: %i[show create new] do
    resources :messages, only: :create
  end
end
