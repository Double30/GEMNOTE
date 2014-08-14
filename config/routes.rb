Gbox::Application.routes.draw do
  get "repositories/index"
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}

  root 'dashboard#index'
  resources :repositories
  resources :categories, :only => [:index,:show]
end
