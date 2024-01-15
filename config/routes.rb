Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    resources :posts do
      resources :comments
      resources :likes, only: [:create, :destroy]
      post '/tags/:tag_id', to: 'tags#add_to_post', as: :add_tag
      delete '/tags/:tag_id', to: 'tags#remove_from_post', as: :remove_tag
    end

    resources :comments do
      resources :likes, only: [:create, :destroy]
    end

    resources :tags, only: [:index, :create]

    resources :users do
      resources :likes, only: [:index]
    end
  end
end
