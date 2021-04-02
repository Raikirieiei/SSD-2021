Rails.application.routes.draw do
  resources :categories do
    resources :connect_categories
  end
  root 'products#index'
  devise_for :admins
  resources :products

  namespace :products do
    post 'csv_upload'
  end
end
