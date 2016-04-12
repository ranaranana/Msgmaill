Rails.application.routes.draw do
 

  mount Ckeditor::Engine => '/ckeditor'
  # resources :messages ,only: [:update]
   

  devise_for :users
  resources :message
  resources :contact
  get "index/profile" =>"profile#index"
  get "edit/profile" => "profile#edit"
    put "/profiles" =>"profile#update"
    #resources :profile ,only:[:edit,:update]
     # => post 'user/review' => 'cart#review_create'
    get "home/index" => "home#index"
    get "get_inbox" => "message#get_inbox"
     get "/trash" => "message#trash", as: :message_trash
    #delete 'message/remove/:id' => 'messages#remove', as: 'message_remove'

     delete 'message/remove/:id' => 'message#remove', as: 'message_remove'
      get 'message/restore/:id' => 'message#restore', as: 'message_restore'
      get 'message/page/:id' => 'message#page', as:'message_page'
      root 'home#index'

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
