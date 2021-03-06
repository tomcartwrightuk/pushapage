Pushapage::Application.routes.draw do

  get "pages/home"
  match "/setup" => "pages#setup"
  match "/mobile_setup" => "pages#mobile_setup"
  match "/pullapage_setup" => "pages#mobile_pullapage"
  match "/pushapage_history_setup" => "pages#mobile_pushapage_history"

  devise_for :users,  :controllers => { :registrations => "users/registrations", :sessions => "users/sessions" }
  devise_scope :user do
    match "users/check_email" => "users#check_email"
    match "/sign_in_again" => "users/sessions#change_user"
    match "/sign_in", :to => "users/sessions#new"
    match '/insta_check' => 'users#insta_check'
  end

  resources :site_references do
    get 'pullapage_screen', :on => :collection
  end
  match "/site_references/instapaper_bookmark" => "site_references#instapaper_bookmark"
  match "/addsite" => "site_references#create"
  match "/to_instapaper" => "site_references#to_instapaper"

  match "/latest" => "site_references#latest", :as => "latest"
  root :to => 'pages#home'
  match "/bookmark" => "site_references#bookmark"
  resources :token_authentications, :only => [:create, :destroy]

  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
