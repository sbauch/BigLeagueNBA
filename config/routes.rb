BigLeague::Application.routes.draw do  
  resources :authentications
  get '/auth/:provider/callback' => 'authentications#create'
  get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  resources :games
  get 'leagues/:id/new', :controller => 'league_memberships', :action => 'create'
  get 'players/:id/new', :controller => 'player_ownerships', :action => 'create'
  get 'player_ownerships/:id', :controller => 'player_ownerships', :action => 'destroy'  
  get 'matchups' => 'pages#matchups'
  resources :player_ownerships

  resources :pages
  root :to =>  "pages#home"

  #match "players/:action", :controller => 'players', :action => 'add_player'
  post 'players/:id/add_player', :controller => 'players', :action => 'add_player'
  get 'players/:id/add_player', :controller => 'players', :action => 'add_player'
  resources :players

  resources :leagues

  resources :teams

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :users, :controllers => {:registrations => "registrations"}

  
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
