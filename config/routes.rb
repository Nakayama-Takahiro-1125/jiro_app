Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#home'
  resources :users, :only => [:show]
  resources :posts 
  resources :groups, :only => [:new, :create, :index, :show] do
    resources :groupposts, :only => [:new, :create]
  end
  post '/like/:post_id', to: 'likes#create', as: 'like'
  delete '/like/:post_id', to: 'likes#destroy', as: 'unlike'
  

end
