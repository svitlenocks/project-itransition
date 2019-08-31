Rails.application.routes.draw do
  resources :users_admin, :controller => 'users' 

  resources :users_admin do
    collection do
      patch 'admin_actions'
    end
  end

  resources :compaigns
  root to: 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
