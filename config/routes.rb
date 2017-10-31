Rails.application.routes.draw do

  get '/' => 'home#index'
  get '/team' => 'home#team'
  get '/profile' => 'home#profile'
  get '/profile/edit' => 'home#edit_profile_form'
  post '/profile/edit/confirm' => 'home#edit_profile'
  post '/search' => 'home#search'
  get '/search/result' => 'home#search_result' 
  get '/signup' => 'authentication#signup'
  post '/signup' => 'authentication#confirm_email'
  post '/confirm_signup' => 'authentication#confirm_signup'

  get '/signin' => 'authentication#signin'
  post '/signin' => 'authentication#confirm_signin'

  get '/signout' => 'authentication#signout'

  get '/stores' => 'store#index'
  get '/stores/show/:store_id' => 'store#products'
  get '/store/add' => 'store#add_edit'
  get '/store/edit/:store_id' => 'store#add_edit'
  post '/store/edit/:store_id/confirm' => 'store#add_edit_store'
  post '/store/add/confirm' => 'store#add_edit_store'
  get '/store/:store_id/products' => 'store#products'
  get '/store/delete/:store_id' => 'store#delete'

  get '/products' => 'product#index'
  get '/products/show/:product_id' => 'product#show'
  get '/product/add' => 'product#add_edit'
  get '/product/edit/:product_id' => 'product#add_edit'
  post '/product/edit/:product_id/confirm' => 'product#add_edit_product'
  post '/product/add/confirm' => 'product#add_edit_product'
  get '/product/delete/:product_id' => 'product#delete'

  get '/cart' => 'cart#index'
  get '/cart/add/:product_id' => 'cart#add'
  get '/cart/remove/:product_id' => 'cart#remove'

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
