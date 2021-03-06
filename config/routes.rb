Rails.application.routes.draw do
  match '/friendlist/:user_id', to: 'api#friends', via: 'get'
  match '/friend/:user_id/:friend_id', to: 'api#become_friend', via: 'post'
  match '/talk/:user_id/:friend_id/:message', to: 'api#talk', via: 'post'

  match '/get_users_from_name', to: 'api#get_users_from_name', via: 'get'
  match '/search_users', to: 'api#get_users', via: 'get'

  match '/chat/:friend_id', to: 'api#chat', via: 'get'
  match '/profile/:user_id', to: 'api#profile_upload', via: 'post'
  match '/friend/:name', to: 'api#regist', via: 'post'
  #devise_for :talks
  #devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' =>x 'catalog#view'

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
