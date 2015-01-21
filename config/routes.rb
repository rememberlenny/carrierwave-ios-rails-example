Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  root 'attachments#index'

  resources :attachments, only: [:index]

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :attachments, only: [:index, :show, :create, :destroy]
    end
  end
end
