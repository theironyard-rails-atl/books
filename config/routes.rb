Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  resources :books, only: [:index, :create, :update, :show, :destroy] do
    member do
      get  :reviews
      post :review
      post :recommend
    end
    collection do
      post :query
    end
  end

  resources :users, only: [:index, :show] do
    member do
      post :friend
      post :unfriend
    end
  end

  resources :categories, only: [:show]

  get '/friends'         => 'users#friends'
  get '/recommendations' => 'books#recommendations'

  root to: "books#index"
end
