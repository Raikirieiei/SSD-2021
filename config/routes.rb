Rails.application.routes.draw do
  
  root 'homes#index'
  devise_for :admins

  resources :homes
  
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
