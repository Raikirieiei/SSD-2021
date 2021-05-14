Rails.application.routes.draw do
  
  resources :orders
  root 'homes#index'
  devise_for :admins

  resources :homes do
    resources :orders
  end

  namespace :admins do

    resources :categories do
      resources :connect_categories
    end
  
    resources :products do
      member do
        delete :delete_cover_attachment
      end
    end

    namespace :products do
      post 'csv_upload'
    end
  end

end
