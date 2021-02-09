Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :farms
  root 'farms#index'
  post 'farms/:id', to: 'farms#show'
end
