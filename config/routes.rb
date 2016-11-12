Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :users do
      member do
        post :make_admin
        post :make_user
      end
    end

    resources :works do
      member do
        post :publish
        post :hide
      end
    end
  end
end
