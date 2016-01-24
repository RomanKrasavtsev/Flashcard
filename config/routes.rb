Rails.application.routes.draw do
  get "password_resets/create"
  get "password_resets/edit"
  get "password_resets/update"
  root "reviews#new"

  resources :registrations, only: [:create]
  get "signup" => "registrations#new", as: "signup"

  get "settings" => "settings#index"

  get "settings/email" => "settings#email", as: "settings_email"
  patch "settings/email" => "settings#update_email", as: "settings_email_update"

  get "settings/telegram" => "settings#telegram", as: "settings_telegram"
  patch "settings/telegram" => "settings#update_telegram", as: "settings_telegram_update"

  get "settings/password" => "settings#password", as: "settings_password"
  patch "settings/password" => "settings#update_password", as: "settings_password_update"

  resources :sessions, only: [:create]
  get "login" => "sessions#new", as: "login"
  get "logout" => "sessions#destroy", as: "logout"

  resources :cards, except: :show
  resources :reviews, only: [:new, :create]
  resources :password_resets

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
