Rails.application.routes.draw do
      
  namespace :api do
    namespace :v1 do
      resources :friends
      resources :posts
      resources :likes
      resources :comments
      resources :users
    end 
  end  
end
