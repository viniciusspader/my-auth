MyAuth::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  root :to => 'home#index'


  resources :users
  resources :sessions

  match 'users/:id/settings' => 'users#settings'

end
