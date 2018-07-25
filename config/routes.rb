Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => "users/registrations"
  }
  resources :users

  get 'list/index'

  resources :books

  root 'list#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
