Rails.application.routes.draw do
  root 'pages#home'
  resources :events

  post 'session/login', to: 'session#create', as: :create_session
  post 'session/login', to: 'session#destroy', as: :destroy_session
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
