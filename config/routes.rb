Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  
  root 'static_pages#home'

  get '/login' => 'static_pages#login', as: :login_path
  
  post '/login' => 'static_pages#verify'

  post '/albums' => 'album#create'
  get '/albums/new' => 'album#new', as: :create_album
  get '/albums/:id' => 'album#album', as: :album
  get '/albums/:id/edit' => 'album#edit', as: :edit_album
  get '/albums/:id/delete' => 'album#destroy', as: :destroy_album
  patch '/albums/:id' => 'album#update'

  get '/:page' => 'static_pages#page', as: :page

  get '/:page/edit' => 'static_pages#edit', as: :edit
  patch '/:id' => 'static_pages#update'

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
