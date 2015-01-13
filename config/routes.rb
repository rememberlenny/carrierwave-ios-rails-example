Rails.application.routes.draw do
  devise_ios_rails_for :users

  root 'attachments#index'
  resources :attachments, only: [:index, :show, :create]
end
