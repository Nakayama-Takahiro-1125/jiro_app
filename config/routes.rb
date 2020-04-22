Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#home'
  resources :users, :only => [:show]
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  
  

end
