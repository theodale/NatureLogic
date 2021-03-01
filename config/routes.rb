Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :farms do
    get 'carbon-snapshot', to: 'farm_display#carbon_snapshot', as: 'carbon_snapshot'
    get 'energy-snapshot', to: 'farm_display#energy_snapshot', as: 'energy_snapshot'
    get 'nature-snapshot', to: 'farm_display#nature_snapshot', as: 'nature_snapshot'
  end
  resources :farm_creation
  root 'farms#index'
  post 'farms/:id', to: 'farms#show'
end
