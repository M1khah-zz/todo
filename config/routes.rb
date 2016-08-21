Rails.application.routes.draw do
  devise_for :users
  root 'lists#index'
  resources :lists
  resources :tasks do
    collection { post :sort }
    member do
      post 'done'
    end
  end
end
