Rails.application.routes.draw do
  get 'categories/index'

  get 'categories/show'

  get 'user/show'

  get 'pages/index'

  get 'pages/about'

  get 'pages/contact'

  resources :items
  resources :categories
  devise_for :users
  resources :user, only: [:show]
  root "pages#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
