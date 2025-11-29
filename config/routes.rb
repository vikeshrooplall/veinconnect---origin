Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  root to: "pages#home"

  resources :donations, only: [:index, :show]
  resources :facilities, only: [:index]
  resources :donors, only: :index
  resources :questions, only: [:index, :create]

  devise_scope :user do
    get 'sign_up/choose_type', to: 'registrations#choose_type', as: :choose_user_type
  end

  resources :blood_requests do
    collection do
      get :donor_index
      get :urgent_requests
      get :accepted_requests
    end

    member do
      patch :accept
      # patch :reject
      patch :complete
    end
  end

  resources :notifications, only: [:index, :show] do
    member do
      patch :mark_as_read
    end
  end
end
