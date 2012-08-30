SmsAlert::Application.routes.draw do

  get "call_manager/sms"

  get "call_manager/voice"

  resources :users
  resources :sessions
  get 'register', to: 'users#new', as: 'register'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :accounts, :path => 'numbers' do
    resources :subscribers
    resources :broadcasts
  end

  root :to => 'accounts#index'

end
