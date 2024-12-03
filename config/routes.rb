Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/show'
  devise_for :players
  root to: "pages#home"

  resources :games do
    member do
      post :update_runs
    end
    collection do
      get :mine
    end
<<<<<<< HEAD
    resources :game_players, only: [:create]

  end
=======
>>>>>>> master

    resources :game_players, only: [:create]
    resources :comments, only: [:create] do
      collection do
        get :chat # Route pour le chat imbriqué sous les jeux
      end
    end
  end

  resources :notifications, only: [:index, :destroy]

  # resources :notifications, only: [:index] do
  #   member do
  #     patch :mark_as_read
  #   end
  # end
  
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
