Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  root to: "pages#home"

  resources :donations, only: [:index, :show]
  resources :facilities, only: [:index]
  resources :blood_requests

  devise_scope :user do
    get 'sign_up/choose_type', to: 'registrations#choose_type', as: :choose_user_type
  end

  resources :blood_requests do
    resources :notifications, only: :create
  end
end
