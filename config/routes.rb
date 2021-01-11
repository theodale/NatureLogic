Rails.application.routes.draw do
  devise_for :users
  resources :farms
  root 'farms#index'
end
