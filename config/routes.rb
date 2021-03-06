Rails.application.routes.draw do


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'game_threads#index'

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
  resources :scripts do
    patch 'upvote' => 'scripts#upvote'
    patch 'unvote' => 'scripts#unvote'
  end

  get 'room_table_pane' => 'game_threads#room_table_pane'
  resources :game_threads do
    patch 'add_writer' => 'game_threads#add_writer'
    patch 'remove_writer' => 'game_threads#remove_writer'
    post 'switch_phase/:user_phase' => 'game_threads#switch_phase'
    get 'script_pane' => 'game_threads#script_pane'
    get 'writer_pane' => 'game_threads#writer_pane'
    get 'top_voted_scripts_pane' => 'game_threads#top_voted_scripts_pane'
    post 'next_round' => 'game_threads#move_to_next_round'
    # get 'timer_pane' => 'game_threads#timer_pane'
  end

  devise_for :users, :controllers => { registrations: 'registrations' }
  devise_scope :user do
    get '/users/:id' => 'registrations#profile'
  end



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
