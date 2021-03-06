Rails.application.routes.draw do

  post '/login', to: 'api/v1/sessions#create'
  delete '/logout', to: 'api/v1/sessions#destroy'
  get '/logged_in', to: 'api/v1/sessions#is_logged_in?'
      
  namespace :api do
    namespace :v1 do
      resources :friends
      resources :posts do
        resource :likes 
      end
      resources :comments
      resources :likes
      resources :users do
        resource :likes
      end
    end 
  end  
end
