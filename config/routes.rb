Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  root 'attachments#index'

  resources :attachments, only: [:index]

  mount CarrierwaveIosRails::Engine => "/"
end
