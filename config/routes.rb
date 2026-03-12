Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
  resources :devices, only: [:create, :show] do
    member do
      get :manual
      get :script
    end
  end
  get "explore", to: "pages#explore"
  get "explore/category/:id", to: "pages#explore_category", as: :explore_category
  get "profile", to: "users#show", as: :profile
  get "profile/edit", to: "users#edit", as: :edit_profile
  patch "profile", to: "users#update"

  resources :videos, only: [:new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
