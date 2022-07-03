Rails.application.routes.draw do
  devise_for :users

  root to: 'main#index'

  resources :posts

  mount RailsAdmin::Engine => '/adminlmom91fnfxw6uuke8y8pzbnueiq35hg8m1buqh5w24dvu2x0y8pjriv53jd7l182', as: 'rails_admin'

end
