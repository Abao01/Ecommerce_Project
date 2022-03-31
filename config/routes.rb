Rails.application.routes.draw do
  get 'publishers/index'
  get 'publishers/show'
  get 'games/index'
  get 'games/show'

  resource :games, only: [:index, :show]
  resource :publishers, only: [:index, :show]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
