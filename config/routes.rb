Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :index]
  resources :businesses do
    resources :tokens, only: [:new, :create]
  end
  resources :tokens, only: [:index, :show, :destroy, :edit, :update]
  # For details on the DSL available within this falseile, see http://guides.rubyonrails.org/routing.html
end
