Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :locations
  end
   get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  root to: "admin/dashboard#index"
end
