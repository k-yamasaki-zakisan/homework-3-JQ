Rails.application.routes.draw do
  resources :home ,only: [:index, :about]
  get 'home/about', to: 'home#about'
  resources :books
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index, :edit, :update]
  root :to=>'home#index'
  
end
