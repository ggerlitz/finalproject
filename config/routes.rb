Rails.application.routes.draw do

  resources :motivations
	resources :assessments

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, :only => [:show] 

  post 'twilio/incoming', to: 'twilio#incoming'

  root 'home#index'
end
