Rails.application.routes.draw do
  root 'dashboards#index'
  resources :resources
  resources :quotations
end
