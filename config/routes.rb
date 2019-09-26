Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get 'comments/create'
  resources :posts
  resources :benefits
  resources :users_admin, :controller => 'users' 

  resources :users_admin do
    collection do
      patch 'admin_actions'
    end
  end


  get 'pages/lock'
  get 'pages/user_compaigns'
  get 'pages/user_supported'
  get 'compaigns/support'
  get '/compaigns/:id/posts', to: 'compaigns#posts', as: 'updates'
  patch 'compaigns/update_current_sum'
  
  resources :compaigns do
    # post 'comments', to: 'comments#create'
    resources :comments, only: [:create, :destroy]
  end

  root to: 'compaigns#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
