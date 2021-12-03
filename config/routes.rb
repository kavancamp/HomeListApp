Rails.application.routes.draw do
  devise_for :accounts
  resources :properties
  root to: 'public#main'
  
  get "/accounts" => 'admin#accounts', as: :accounts
  get "/dashboard" => 'dashboard#index', as: :dashboard
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

