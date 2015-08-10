Indiegaga::Application.routes.draw do
  root to: 'ui#index'
  get 'ui(/:action)', controller: 'ui'

  resources :artists, only: [:show, :index] do
    collection do
      get :search
    end
    resources :reviews, only: [:create]
  end
  resources :genre, only: [:create]
end
