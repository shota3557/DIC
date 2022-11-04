Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :blogs
  root to: 'blogs#index'
end

