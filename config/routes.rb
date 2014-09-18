Rails.application.routes.draw do
  devise_for :users

  get '/books/search' => 'books#search'

  resources :books, only: [:index, :create, :update, :show, :destroy] do
    member do
      get  :reviews
      post :review
      post :recommend
    end

    #get :search, on: :collection

    #collection do
    #  get :search
    #end
  end

  resources :users, only: [:index] do
    member do
      post :friend
      post :unfriend
    end
  end

  get '/friends'         => 'users#friends'
  get '/recommendations' => 'books#recommendations'

  root to: "static_pages#home"
end
