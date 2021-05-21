Rails.application.routes.draw do

  devise_for :estate_users, controllers: { sessions: "sessions", registrations: "registrations" }
  devise_for :farm_users, controllers: { sessions: "sessions", registrations: "registrations" }
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  # Pages
  root 'pages#home'
  get 'pages/home'

  # Estates
  resources :estates do
    get 'add-farm', to: 'estates#add_farm', as: 'add_farm'
    post 'add-farm', to: 'estates#create_farm', as: 'estate_add_farm'
    get 'add-farm-user', to: 'estates#add_farm_user', as: 'add_farm_user'
    post 'add-farm-user', to: 'estates#create_farm_user', as: 'estate_add_farm_user'
    get 'overview', to: 'estates#overview', as: 'overview'
    get 'performance', to: 'estates#performance', as: 'performance'
  end

  # Farms
  resources :farms do
    get 'snapshot', to: 'farms#snapshot', as: 'snapshot'
    get 'carbon', to: 'farms#carbon', as: 'carbon'
    get 'energy', to: 'farms#energy', as: 'energy'
    get 'nature', to: 'farms#nature', as: 'nature'
    get 'sustainability', to: 'farms#sustainability', as: 'sustainability'
    get 'soil', to: 'farms#soil', as: 'soil'
    get 'strategy', to: 'farms#strategy', as: 'strategy'
    get 'profile', to: 'farms#profile', as: 'profile'
    get 'create-in-timeline', to: 'farms#create_in_timeline', as: 'create_in_timeline'
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

  # Farm Creation
  resources :farm_creation
  get 'farm-user-create-farm', to: 'farms#create', as: 'farm_user_create_farm'

end
