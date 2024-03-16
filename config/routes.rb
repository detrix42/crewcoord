Rails.application.routes.draw do
  get 'business/create'
  get 'session/signup'
  get 'session/login'
  get 'session/create'
  get 'home/index', to: 'home#landing'

  resources :business

  # get 'company_signup', to: ''
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#landing"
end
