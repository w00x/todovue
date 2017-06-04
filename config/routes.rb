Rails.application.routes.draw do
  root 'main#index'

  get '/session', to: 'session#index', as: 'session_index'
  post '/session/new', to: 'session#new', as: 'session_new'
  get '/session/destroy', to: 'session#destroy', as: 'session_destroy'
  get '/session/new_account', to: 'session#new_account', as: 'session_new_account'
  post '/session/create_account', to: 'session#create_account', as: 'session_create_account'
  post '/session/validate_account', to: 'session#validate_account', as: 'session_validate_account'
  get '/session/rescue_password', to: 'session#rescue_password', as: 'session_rescue_password'
  post '/session/do_rescue_password', to: 'session#do_rescue_password', as: 'session_do_rescue_password'

  namespace :api do
    namespace :v1 do
      resources :todos, only: [:index, :create, :destroy, :update]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
