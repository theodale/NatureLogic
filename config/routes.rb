Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :farms do
    get 'snapshot', to: 'farm_display#snapshot', as: 'snapshot'
    get 'carbon-performance', to: 'farm_display#carbon_performance', as: 'carbon_performance'
    get 'energy-performance', to: 'farm_display#energy_performance', as: 'energy_performance'
    get 'nature-performance', to: 'farm_display#nature_performance', as: 'nature_performance'
    get 'soil-performance', to: 'farm_display#soil_performance', as: 'soil_performance'
    resource :lab_based_soil_test do
      resources :soil_parcels
    end
    resource :in_field_soil_test do
      resources :soil_samples
    end
  end
  resources :farm_creation
  root 'farms#index'
  post 'farms/:id', to: 'farms#show'
end
