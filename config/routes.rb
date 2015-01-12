Rails.application.routes.draw do
  devise_ios_rails_for :users

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :photos, only: [:index, :show, :create]
    end
  end
end
