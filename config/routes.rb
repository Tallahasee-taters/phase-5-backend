Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :friendships, only: [:create, :destroy]
      resources :video_posts, only: [:index, :show, :create, :update, :destroy]
      resources :comments, only: [:index, :show, :create, :update, :destroy]
      resources :videos, only: [:index, :show, :update, :create, :destroy]
      resources :users, only: [:update, :destroy, :create, :show]
      post '/login', to: 'sessions#login'
      delete 'logout', to: 'sessions#logout'
      get '/authorized_user', to: 'users#show'
      post 'signup', to: 'users#create'
    end
  end
end
