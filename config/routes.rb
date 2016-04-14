Rails.application.routes.draw do
 


  resources :cals
  resources :events
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
     get "/favorite" => "message#favorite_msg", as: :message_favorite
     get'/favorite_update' => "message#favorite_update"
    #delete 'message/remove/:id' => 'messages#remove', as: 'message_remove'

     delete 'message/remove/:id' => 'message#remove', as: 'message_remove'
      get 'message/restore/:id' => 'message#restore', as: 'message_restore'
      get 'message/page_count/:id' => 'message#page_count', as:'message_page'
      root 'home#index'

     #SETTING PAGE
      get 'setting/index' , to: 'settings#index'
      post 'setting/create_inboxlimit', to:'settings#create_inboxlimit'
end
