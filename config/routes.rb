Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'account/registrations'}

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :conversations do
    member do
      post :reply
    end
  end
  resources :messages

  namespace :account do
    resources :user
    resources :requests do
      member do
        get :display
        post :choose
        post :make_payment
      end
      resources :users
    end
  end

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
    resources :requests do
      member do
        post :applied
        post :join_applicants

      end
    end
  end

  resources :requests

  resources :users

end
