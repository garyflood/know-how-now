Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
  resources :users, only: [] do
    resources :videos, only: [:new, :create]
  end

  resources :devices, only: [:create, :show, :update] do
    member do
      get :manual
      get :related
    end
    resources :videos, only: [:show]
  end
  resources :bookmarks, only: [:create, :destroy, :index]
  get "explore", to: "pages#explore"
  get "explore/category/:id", to: "pages#explore_category", as: :explore_category
  get "profile", to: "users#show", as: :profile
  get "profile/uploads", to: "users#uploads", as: :profile_uploads
  get "profile/edit", to: "users#edit", as: :edit_profile
  patch "profile", to: "users#update"
  get "videos/contributors/:id", to: "videos#contributor", as: :video_contributor
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
