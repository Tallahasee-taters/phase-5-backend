Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      delete '/friendships/remove', to: 'friendships#remove'
      resources :friendships, only: [:create, :update, :destroy]
      resources :video_posts, only: [:index, :show, :create, :update, :destroy]
      resources :comments, only: [:index, :show, :create, :update, :destroy]
      resources :videos
      resources :users
      post '/login', to: 'sessions#login'
      delete 'logout', to: 'sessions#logout'
      get '/authorized_user', to: 'users#show'
      post 'signup', to: 'users#create'
    end
  end
end
