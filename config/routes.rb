Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_ios_rails_for :users

  root 'attachments#index'
  resources :attachments, only: [:index, :show, :create, :destroy]
end
