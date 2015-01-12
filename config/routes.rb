Rails.application.routes.draw do
  devise_ios_rails_for :users

  root 'photos#index'
  resources :photos, only: [:index, :show, :create]
end
