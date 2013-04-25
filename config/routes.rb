MyAuth::Application.routes.draw do

  mount Piggybak::Engine => '/store', :as => 'piggybak'
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  root :to => 'home#index'


  resources :users
  resources :sessions
  resources :products

  match 'users/:id/settings' => 'users#settings'

end
