Rails.application.routes.draw do

  devise_for :accounts
  resources :properties
  root "public#main"
  
  get "/accounts" => 'admin#accounts', as: :accounts
  get "/dashboard" => 'dashboard#index', as: :dashboard

  devise_scope :user do
    get '/accounts/sign_out' => 'devise/sessions#destroy', method: :delete
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

