Rails.application.routes.draw do
  devise_for :users

  root to: 'main#index'

  resources :posts

  mount RailsAdmin::Engine => "/#{ENV["ROUTE_LINK"]}", as: 'rails_admin'

end
