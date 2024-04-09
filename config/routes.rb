Rails.application.routes.draw do
  get 'crew_manager_verification/confirm_token'
  get 'business/create'
  get 'signup', to: 'session#signup'
  get 'login_form', to: 'session#login_form'

  get 'home/index', to: 'home#landing'
  post 'logout', to: 'session#logout'

  post 'login_actual', to: 'session#login_actual'

  resources :business

  # get 'company_signup', to: ''
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#landing"
end
