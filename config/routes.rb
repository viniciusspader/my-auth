MyAuth::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users

  root :to => 'home#index'

  match 'users/:id/settings' => 'users#settings'

  resources :users
  resources :sessions

end
