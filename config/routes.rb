Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'

  resources :users, only: [:show, :index]
  resources :businesses do
  resources :tokens, only: [:new, :create]
  end
  resources :tokens, only: [:index, :show, :destroy, :edit, :update]
  resources :followings, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
