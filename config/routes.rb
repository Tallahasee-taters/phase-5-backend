  Rails.application.routes.draw do
  resources :friendships
  resources :video_posts
  resources :comments
  resources :videos
  resources :users
    # route to test your configuration
    get '/hello', to: 'application#hello_world'
  end
end
