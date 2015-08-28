Indiegaga::Application.routes.draw do
  root to: 'pages#front'

  mount Sidekiq::Web, at: '/sidekiq'

  get '/ui', 'ui#index'
  get 'ui(/:action)', controller: 'ui'

  resources :artists, only: [:show, :index] do
    collection do
      get :search
    end
    resources :albums, only: [:show]
    resources :reviews, only: [:create]
  end
  resources :genre, only: [:show]

  namespace :admin do
    resources :payments, only: [:index]
    resources :artists, only: [:new, :create]
    resources :albums, only: [:new, :create]
  end

  get '/register', to: 'users#new'
  resources :users, only: [:create, :new]
  get 'register/:token', to: "users#new_with_invitation_token", as: 'register_with_token'
  get '/sign_in', to: 'sessions#new'
  get '/sign_out', to: 'sessions#destroy'
  resources :sessions, only: [:create]

  get '/playlist', to: "playlists#index"
  resources :playlist_items, only: [:create, :destroy]
  post 'update_queue', to: 'queue_items#update_queue'

  get 'people', to: 'relationships#index'
  resources :relationships, only: [:create, :destroy]

  get 'forgot_password', to: 'forgot_passwords#new'
  resource :forgot_passwords, only: [:create]
  get 'forgot_password_confirmation', to: 'forgot_passwords#confirm'

  resources :passwords_resets, only: [:show, :create]
  get 'expired_token', to: 'pages#expired_token'

  resources, :invitations, only: [:new, :create]

  mount Stripe::Engine => '/stripe_events'
end
