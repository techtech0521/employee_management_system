Rails.application.routes.draw do
  # get "users/index"
  # get "users/show"
  # get "users/edit"
  # get "users/update"
  # get "users/destroy"
  # get "users/new"
  # get "users/create"
  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  devise_for :users, skip: [:registrations]
  resources :users

  devise_scope :user do
    get 'users/edit', to: 'devise/registrations#edit', as: :edit_user_registration
    patch 'users', to: 'devise/registrations#update', as: :user_registration
    put 'users', to: 'devise/registrations#update'
    delete 'users', to: 'devise/registrations#destroy' # 必要であればアカウント削除も残す
  end

  root to: "home#index"
end
