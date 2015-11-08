Rails.application.routes.draw do
  get 'home/index'
  post 'twilio/incoming', to: 'twilio#incoming'
	resources :assessments
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, :only => [:show] 

  root 'home#index'
end
