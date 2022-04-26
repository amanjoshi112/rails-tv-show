require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  devise_for :users
  devise_for :installs
  mount Sidekiq::Web => '/sidekiq'
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "channels#index"

  resources :channels do
    member do 
      resources :shows
    end
  end

  resources :shows, only: :index do
      member do
        resources :favorites, only: [:create, :destroy]
      end
   end
end
