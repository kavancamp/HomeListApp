Rails.application.routes.draw do
  get 'admin/accounts'
  resources :properties
  root "public#main"
  devise_for :accounts
  
  
  get "/accounts" => 'admin#accounts', as: :accounts
  get "/dashboard" => 'dashboard#index', as: :dashboard
  get '/search', to: "properties#search"
  
  devise_scope :account do
    get "/accounts/sign_out" => "devise/sessions#destroy"
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

