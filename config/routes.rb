Rails.application.routes.draw do
  get 'notifications/index'
  get 'notifications/show'
  get 'blood_requests/index'
  get 'blood_requests/new'
  get 'blood_requests/create'
  get 'blood_requests/update'
  get 'facilities/index'
  get 'donations/index'
  get 'donations/show'
  get 'donors/index'
  get 'donors/show'
  get 'donors/edit'
  get 'donors/new'
  get 'donors/create'
  get 'donors/update'
  get 'donors/medical_new'
  get 'donors/medical_create'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :donations, only: [:index, :show]
end
