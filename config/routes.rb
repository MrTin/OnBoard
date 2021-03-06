OnBoard::Application.routes.draw do

  root :to => 'browse#index'

  match 'upload' => 'upload#index', as: :upload
  match 'upload/submit' => 'upload#submit', :as => :submit

  match 'latest' => 'browse#latest', :as => :latest
  match 'next/:offset' => 'browse#next', :as => :next
  match 'top_rated' => 'browse#top_rated', :as => :top_rated
  
  match 'why' => 'browse#why', :as => :why

  match 'admin' => 'admin#index'

  match 'admin/login' => 'admin#login', :as => :admin_login
  match 'admin/logout' => 'admin#logout', :as => :admin_logout

  match 'admin/unconfirmed_posts' => 'admin#unconfirmed_posts', :as => :unconfirmed_posts
  match 'admin/confirmed_posts' => 'admin#confirmed_posts', :as => :confirmed_posts

  match 'admin/confirm_all' => 'admin#confirm_all_posts', :as => :confirm_all_posts
  match 'admin/confirm_post/:id' => 'admin#confirm_post', :as => :confirm_post
  match 'admin/unconfirm_post/:id' => 'admin#unconfirm_post', :as => :unconfirm_post
  match 'admin/delete_post/:id' => 'admin#delete_post', :as => :delete_post

  match ':unique_id' => 'browse#fullsize', :as => :fullsize



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
