Rails.application.routes.draw do
  post 'credit_card/validate'
  get 'vogon/ping'

  get 'crew_member/create', to: 'crew_member#create'
  post 'crew_member/create', to: 'crew_member#create_actual'
  get 'crew_member/fetch'
  get 'crew_member/update'
  get 'crew_member/destroy'

  get 'crew_manager_verification/confirm_form'
  post 'crew_manager_verification/confirm_token/', to: 'crew_manager_verification#confirm_token'

  get 'password_reset/prompt_email'
  get 'password_reset/reset'
  post 'password_reset/reset', to: 'password_reset#reset_submit'
  get 'password_reset/update'
  post 'password_reset/update', to: 'password_reset#update_submit'
  post 'password_reset/reset_verify', to: 'password_reset#reset_verify'
  get 'password_reset/new_password'
  get 'password_reset/update'
  post 'password_reset/update', to: 'password_reset#update_submit'

  get 'business/create'
  post 'business/create', to: 'business#create_actual'

  get 'login_form', to: 'session#login_form'

  get 'home/index', to: 'home#landing'
  post 'logout', to: 'session#logout'

  post 'login_actual', to: 'session#login_actual'

  get 'vogon/ping', to: 'vogon#ping'
  post 'vogon/ping', to: 'vogon#ping'

  resources :business

  # get 'company_signup', to: ''
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#landing"
end
