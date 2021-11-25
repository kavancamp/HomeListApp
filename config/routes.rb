Rails.application.routes.draw do
  devise_for :accounts
  resources :properties

  get "/accounts" => 'admin#accounts', as: :accounts
  get "/dashboard" => 'dashboard#index', as: :dashboard
  root to: 'public#main'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

