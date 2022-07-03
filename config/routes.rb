Rails.application.routes.draw do
  devise_for :users

  root to: 'main#index'

  resources :posts

  mount RailsAdmin::Engine => '/adminlmom91fnfxw6uuke8y8pzbnueiq35hg8m1buqh5w24dvumykme3lbip1xb361ynk2s2mzt7pmlq2sokol6d3a2x0y8pjriv53jd7l1822a0mmepo9fqjlhojza0c', as: 'rails_admin'

end
