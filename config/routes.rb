Rails.application.routes.draw do
  devise_for :users


  root "articles#index"

 # resources :articles
 resources :articles do
    resources :likes, only: [:create]
    resources :comments do
      resources :likes, only: [:create]
    end
  end

  resources :comments do
          resources :comments do
             resources :likes, only: [:create]
          end
    end


    # resources :articles do
    #     resources :likes, only: [:create] 
    #     resources :comments
    #        resources :likes, only: [:create] 
    #     end  
    #   end

      # resources :comments do
      #    resources :likes, only: [:create] 
      #     resources :comments
      #     resources :comments
      #      resources :likes, only: [:create] 
      #   end 
      # end

get "/likes", to: "likes#show"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 # root to: "home#index" 
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # get "/articles", to: "articles#index"
  # Defines the root path route ("/")
  # root "posts#index"
end
