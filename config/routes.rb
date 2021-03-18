Rails.application.routes.draw do
  root 'products#index'
  devise_for :admins
  resources :products
end
