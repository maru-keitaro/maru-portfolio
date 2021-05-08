Rails.application.routes.draw do
  devise_for :users
  root to: 'cans#index'
  resources :cans do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
    collection do
      get 'set_search'
    end
  end
  resources :users, only: :show
end
