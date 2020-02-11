Rails.application.routes.draw do
  resources :home do
    collection do
      post :napthe
    end
  end
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
