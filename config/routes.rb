Rails.application.routes.draw do
  get 'reviews/create'
  get 'reviews/destroy'
  devise_for :users
  # Root path depends on authentication status
  authenticated :user do
    root to: "listings#index", as: :authenticated_root
  end
  # Non-authenticated users see the welcome page
  root to: "pages#welcome"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :bookings, only: [:index, :show, :edit, :update, :destroy] do
    member do
      patch :accept
      patch :reject
    end
  end
  resources :listings do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:create]
    member do
      patch :activate
      patch :deactivate
    end
  end
  resources :reviews, only: [:destroy]
  get "dashboard", to: "pages#dashboard", as: :dashboard
  get "past_bookings", to: "pages#past_bookings", as: :past_bookings
end
