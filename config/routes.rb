Rails.application.routes.draw do
  root 'tops#index'
  get 'tops/menu'
  get 'lists/index'
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
  resources :families do 
    resources :members, only: %w(create destroy)
    member do
      get 'menu'
    end
  end

  resources :medical_histories
  resources :hospitals
  resources :medication_histories
  resources :pharmacies
  resources :diaries do
    member do
      get 'menu'
    end
  end
  resources :favorites, only: [:create, :destroy]
  resources :health_statuses do 
    member do
      get 'menu'
    end
  end
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
