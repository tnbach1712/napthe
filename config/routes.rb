Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]
  resources :home do
    collection do
      post :napthe
    end
  end
  namespace :admin do
    resources :transaction
    resources :dashboard
    root 'dashboard#index'
  end
  root 'admin/dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
