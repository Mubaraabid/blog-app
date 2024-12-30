Rails.application.routes.draw do
  devise_for :users

  root "articles#index"
  get "/artlist", to: 'articles#artlist', as: 'artlist', defaults: { format: :turbo_stream }

  resources :articles do
    member do
      get :preview
    end
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

  get "up" => "rails/health#show", as: :rails_health_check

end
