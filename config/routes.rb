Rails.application.routes.draw do
  resources :farms
  root 'farms#index'
end
