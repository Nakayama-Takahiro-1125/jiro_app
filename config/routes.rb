Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#home'
  resources :posts
  resources :users, :only => [:show]

end
