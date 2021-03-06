Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => "users/registrations"
  }
  resources :users

  get 'listing/index'

  resources :books

  root 'listing#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
