Rails.application.routes.draw do
  resources :posts
  devise_for :users


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: 'main#index'

  # get '/posts/new', to: 'new#post', as: 'New Post'

  # Defines the root path route ("/")
  # root "articles#index"
  # devise_scope :user do
  #   get '/',  :to => 'destroy_user_session_path'
  # end
end
