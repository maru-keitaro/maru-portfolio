Rails.application.routes.draw do
  devise_for :users
  root to: 'cans#index'
  resources :cans do
    resources :comments, only: :create
    collection do
      get 'set_search'
    end
  end
  resources :users, only: :show
end
