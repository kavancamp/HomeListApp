Rails.application.routes.draw do
  resources :properties
  root "public#main"
  devise_for :accounts
  
  
  get "/accounts" => 'admin#accounts', as: :accounts
  get "/dashboard" => 'dashboard#index', as: :dashboard
  
  devise_scope :account do
    get "/accounts/sign_out" => "devise/sessions#destroy"
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

