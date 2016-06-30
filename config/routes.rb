Rails.application.routes.draw do
  resources :categories
  resources :promotions do
    member do
      put "love", to: "promotions#love"
    end
  end
  resources :coupons do
    member do
      put "love", to: "coupons#love"
    end
  end
  resources :stores
  resources :comments do
    member do
      put "like", to: "comments#upvote"
    end
  end

  get 'home/about', as: :about
  get 'home/contact', as: :contact
  get 'home/top', as: :top

  # Devise routes

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations_controller: "users/registrations_controller"
  }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :users

  # config/routes.rb
  namespace :admin do
    resources :promotions
    post 'promotions/upload'

    resources :stores
    resources :coupons
  end

  # You can have the root of your site routed with "root"
  root to: "promotions#index"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
