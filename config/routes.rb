Rails.application.routes.draw do
  get 'pages/home'
  devise_for :estate_users, controllers: { sessions: "sessions", registrations: "registrations" }
  devise_for :farm_users, controllers: { sessions: "sessions", registrations: "registrations" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :estates do
    get 'add-farm', to: 'estates#add_farm', as: 'add_farm'
    post 'add-farm', to: 'estates#create_farm'
    get 'add-farm-user', to: 'estates#add_farm_user', as: 'add_farm_user'
    post 'add-farm-user', to: 'estates#create_farm_user'
    get 'overview', to: 'estates#overview', as: 'overview'
  end
  resources :farms do
    get 'snapshot', to: 'farm_display#snapshot', as: 'snapshot'
    get 'carbon-performance', to: 'farm_display#carbon_performance', as: 'carbon_performance'
    get 'energy-performance', to: 'farm_display#energy_performance', as: 'energy_performance'
    get 'nature-performance', to: 'farm_display#nature_performance', as: 'nature_performance'
    get 'sustainability-performance', to: 'farm_display#sustainability_performance', as: 'sustainability_performance'
    get 'soil-performance', to: 'farm_display#soil_performance', as: 'soil_performance'
    get 'profile', to: 'farm_display#profile', as: 'profile'
    get 'edit-details', to: 'farms#edit_details', as: 'edit_details'
    get 'edit-energy-usage', to: 'farms#edit_energy', as: 'edit_energy_usage'
    get 'edit-resources', to: 'farms#edit_resources', as: 'edit_resources'
    get 'edit-livestock', to: 'farms#edit_livestock', as: 'edit_livestock'
    resource :biodiversity_survey
    resource :sustainability_survey
    resource :countryside_stewardship_survey
    resource :schemes_survey
    resource :target
    resources :hedgerows
    resources :lands
    resource :lab_based_soil_test do
      resources :soil_parcels
    end
    resource :in_field_soil_test do
      resources :soil_samples
    end
  end
  resources :farm_creation
  root 'pages#home'
  post 'farms/:id', to: 'farms#show'
end
