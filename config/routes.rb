Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :conversations do
    member do
      post :reply
    end
  end

  resources :messages

  #联系人
  namespace :contacts do
    resources :users do
      resources :conversations
      member do
        post :create_conversation
      end
    end
  end
  #./联系人


  #用户中心
  namespace :account do
    resources :user
    resources :requests do
      member do
        post :choose
        post :make_payment
      end
    end
  end
  #./用户中心

  #管理后台
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
  # ./管理后台

  resources :requests
  resources :users do
    resources :requests
  end
  #
  resources :users do
    member do
      post :join
    end
  end
  #./
end
