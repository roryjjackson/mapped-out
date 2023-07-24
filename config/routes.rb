Rails.application.routes.draw do
  resources :recipes
  resources :mentors
  resources :enquiries
  resources :questionnaires
  resources :profiles do
    resources :reviews, only: %i[new create]
  end
  devise_for :users
  root to: "pages#home"

  # resources :chatrooms, only: %i[show create new index] do
  #   resources :messages, only: :create
  # end

  get 'dashboard', to: 'pages#dashboard'
  get 'about', to: 'pages#about'
  get 'admin', to: 'pages#admin'
  get '/search_youtube_videos', to: 'recipes#search_youtube_videos'

end
