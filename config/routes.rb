Rails.application.routes.draw do
  get 'admin/accounts'
  resources :properties
  root "public#main"
  devise_for :accounts
  
  
  get "/accounts" => 'admin#accounts', as: :accounts
  get "/dashboard" => 'dashboard#index', as: :dashboard
  get '/search', to: "properties#search"
  get 'profile/:id', to: 'profile#index', as: :profile
  get 'properties/view/all', to: "properties#all"
  post 'agent/email', to: "properties#email_agent"
  resources :conversations do
    resources :messages
  end
  get 'conversations', to: 'conversations#index'
  
  devise_scope :account do
    get "/accounts/sign_out" => "devise/sessions#destroy"
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

