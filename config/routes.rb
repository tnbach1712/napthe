Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :home do
    collection do
      post :napthe
      get :rut_tien
      get :nap_tien
      get :chuyen_tien
    end
  end
  resources :orders do
    collection do
      get :get_users
    end
  end
  namespace :admin do
    resources :transaction
    resources :dashboard
    resources :users
    resources :orders do
      collection do
        get :list_pending_doi_the
        get :list_pending_rut_tien
      end
      member do
        post :doi_the_success
        post :doi_the_fail
        post :order_fail
        post :order_success
      end
    end
    root 'dashboard#index'

  end
  match 'history', to: 'users#history', via: [:get]
  match 'profile', to: 'users#profile', via: [:get]
  match 'nap-tien', to: 'users#nap_tien', via: [:get]
  match 'rut-tien', to: 'users#rut_tien', via: [:get]
  match 'chuyen-tien', to: 'users#chuyen_tien', via: [:get]
  match 'xac-nhan-chuyen-tien', to: 'users#xac_nhan_chuyen_tien', via: [:post]
  
  root 'home#index'
end
