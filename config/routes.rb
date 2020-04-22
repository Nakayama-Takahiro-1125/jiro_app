Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#home'
  resources :users, :only => [:show]
  resources :posts 
  
  post '/like/:post_id', to: 'likes#create', as: 'like'
  delete '/like/:post_id', to: 'likes#destroy', as: 'unlike'
  

end
