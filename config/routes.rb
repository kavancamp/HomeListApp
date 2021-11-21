Rails.application.routes.draw do
  get '/dashboard' => 'dashboard#index', as: :dashboard
  get 'dashboard/properties', to: 'dashboard#properties'
  get 'dashboard/reports'
  devise_for :accounts
  root to: 'public#main'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

/Users/keenahvancampenhout/Development/code/Mod3/HomeListApp/app/views/dashboard/properties.html.erb