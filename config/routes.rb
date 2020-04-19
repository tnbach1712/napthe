Rails.application.routes.draw do
  devise_for :users
  resources :home do
    collection do
      post :napthe
    end
  end
  resources :orders
  namespace :admin do
    resources :transaction
    resources :dashboard
    root 'dashboard#index'
  end
  match 'history', to: 'users#history', via: [:get]
  # root 'admin/dashboard#index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
