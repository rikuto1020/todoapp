Rails.application.routes.draw do
  devise_for :users
  root "categories#index"
  resources :users, only: [:edit, :update]
  resources :categories, only: [:index, :new, :create] do
    resources :messages, only: [:index, :new,:create]
  end
  
end
