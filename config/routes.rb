Rails.application.routes.draw do
  get 'list/index'

  resources :books

  root 'list#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
