Rails.application.routes.draw do

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  devise_for :users, :controllers => { :registrations => "registrations" }
  resources:users
  resources:organizations
  resources:posts
  resources:staffs
  resources:events

  get '/search' => 'users#search'
  get '/chongdae' => 'organizations#chongdae'
  get '/new_member' => 'organizations#new_member'

  post '/sign_in' => 'devise/sessions#create'
  post'/new_member' => 'organizations#new_member'
  post '/organizations/edit' => 'organizations#edit'
  post '/join' => 'organizations#join'
  post '/create_new_member' => 'users#create_new_member'

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
