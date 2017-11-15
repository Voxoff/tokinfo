Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :index]
<<<<<<< HEAD
  resources :businesses do
    resources :tokens, only: [:new, :create]
  end
  resources :tokens, only: [:index, :show, :destroy, :edit, :update]
  # For details on the DSL available within this falseile, see http://guides.rubyonrails.org/routing.html
=======
  resources :businesses
  resources :tokens
  resources :followings, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
>>>>>>> a9755dbf3b085b3660af67893a4bb6a13c8258e4
end
