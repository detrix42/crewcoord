Rails.application.routes.draw do
  post 'crew_member/create'
  get 'crew_member/fetch'
  get 'crew_member/update'
  get 'crew_member/destroy'
  get 'crew_member/create_form'
  get 'crew_manager_verification/confirm_token'



  get 'business/create'
  get 'signup', to: 'session#signup'
  get 'login_form', to: 'session#login_form'

  get 'home/index', to: 'home#landing'


  post 'logout', to: 'session#logout'

  post 'login_actual', to: 'session#login_actual'

  # resources :crew_member do
  #   get 'create_form', to: 'crew_member#create_form'
  #   get 'create', to: 'crew_member#create'
  #   get 'fetch', to: 'crew_member#fetch'
  #   get 'update', to: 'crew_member#update'
  #   get 'destroy', to: 'crew_member#destroy'
  # end
  resources :business

  # get 'company_signup', to: ''
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#landing"
end
