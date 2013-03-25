MyAuth::Application.routes.draw do

  devise_for :users, :path => '', :path_names => { :sign_in => 'entrar',
                                                   :sign_up => 'cadastro' }

  root :to => 'home#index'

  resources :users
  resources :sessions

end
