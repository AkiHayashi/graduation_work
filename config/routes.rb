Rails.application.routes.draw do
  resources :diaries
  root 'tops#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end
  
  resources :users, only: [:show]
  resources :medical_histories
  resources :hospitals
  resources :medication_histories
  resources :pharmacies
  resources :health_statuses do 
    member do
      get 'menu'
    end
  end
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
