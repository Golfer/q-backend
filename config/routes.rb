require 'sidekiq/web'

Rails.application.routes.draw do
  root 'dashboards#index'
  resources :resources
  resources :quotations
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :search do
        get :quotations, to: 'quotations#query', as: :quotation
      end
      get :quotations, to: 'quotations#query', as: :quotation
      get :tags, to: 'tags#index', as: :tags
    end
  end
  mount Sidekiq::Web, at: '/sidekiq', as: 'sidekiq'
end
