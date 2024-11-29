Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/show'
  devise_for :players
  root to: "pages#home"
  resources :games, only: [:index, :show, :new, :create] do
    collection do
      get :mine
    end
    resources :game_players, only: [:create]

  end

  resources :runs, only: [] do
    collection do
      patch :refresh
    end
  end

  resources :notifications, only: [:index] do
    member do
      patch :mark_as_read
    end
    collection do
      patch :clear_all
    end
  end

  resource :profile, only: [:show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/auth/strava", to: 'strava_auth#redirect'
  get "/auth/strava/callback", to: 'strava_auth#callback'


  # Defines the root path route ("/")
  # root "posts#index"
end
