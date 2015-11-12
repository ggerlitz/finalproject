Rails.application.routes.draw do

  resources :motivations
	resources :assessments

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, :only => [:show] 

  root 'home#index'
end
