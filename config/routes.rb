MyAuth::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  mount Piggybak::Engine => '/store', :as => 'piggybak'
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users, controllers: { sessions: "users/sessions" }

  root :to => 'home#index'


  resources :users
  resources :sessions
  resources :products
  resources :posts

  match 'users/:id/settings' => 'users#settings'

end
