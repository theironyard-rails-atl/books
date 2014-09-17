Rails.application.routes.draw do
  devise_for :users

  resources :books, only: [:index, :create, :update, :show, :destroy] do
    member do
      get  :reviews
      post :review
      post :recommend
    end
  end

  resources :users, only: [:index] do
    member do
      post :friend
      post :unfriend
    end
  end

  get '/friends'         => 'users#friends'
  get '/recommendations' => 'books#recommendations'

  post '/ping' => 'users#ping'

  root to: "static_pages#home"
end
