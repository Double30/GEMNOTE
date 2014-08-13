Gbox::Application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}

  root 'dashboard#index'

  resources :categories, :only => [:index,:show]
end
