Rails.application.routes.draw do

  root 'app#home'
  get '/printers' => 'app#printer'
  get '/mfu' => 'app#mfu'
  get '/scanners' => 'app#scanner'
  get '/paper' => 'app#paper'
  get '/shredders' => 'app#shredder'
  get '/cartridges' => 'app#cartridge'
  get '/laminators' => 'app#laminator'
  get '/bookbinders' => 'app#bookbinder'
  get '/other' => 'app#other'
  get '/search' => 'app#search'
  get '/help' => 'app#help'


  get 'user/(:id)' => 'user#show'
  get 'user/(:id)/edit' => 'user#edit'
  patch 'user/(:id)/edit' => 'user#update'
  get 'signup' => 'user#new'
  post 'signup' => 'user#create'

  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'


  get 'cart/(:id)' => 'cart#show'
  get 'cart/(:id)/process' => 'cart#info'
  post 'cart/(:id)/process' => 'cart#submit'

  get 'item/(:id)' => 'item#show'
  post 'item/(:id)/add' => 'item#add'
  post 'item' => 'item#create'
  patch 'item/(:id)' => 'item#edit'
  delete 'item/(:id)' => 'item#destroy'
  delete 'cart_item/(:id)' => 'cart_item#destroy'
  delete 'cart_items/(:id)' => 'cart_item#remove'
  post 'cart_item/(:id)' => 'cart_item#add'
  post 'feedback/(:id)' => 'item#rate'
  get 'feedback/(:id)/edit' => 'admin#feededit'

  get 'admin' => 'admin#index'
  get 'admin/(:id)' => 'admin#show'
  patch 'feedback/(:id)' => 'admin#feedupdate'
  delete 'feedback/(:id)' => 'admin#feeddestroy'

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
