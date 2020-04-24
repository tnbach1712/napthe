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
    resources :orders do
      collection do
        get :list_pending_doi_the
      end
      member do
        post :doi_the_success
        post :doi_the_fail
      end
    end
    root 'dashboard#index'

  end
  match 'history', to: 'users#history', via: [:get]
  match 'nap-tien', to: 'users#nap_tien', via: [:get]
  match 'rut-tien', to: 'users#rut_tien', via: [:get]
  match 'chuyen-tien', to: 'users#chuyen_tien', via: [:get]
  match 'xac-nhan-chuyen-tien', to: 'users#xac_nhan_chuyen_tien', via: [:post]
  
  root 'home#index'
end
