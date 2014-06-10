Hack::Application.routes.draw do

  devise_for :users, :controllers => { :registrations => 'user_registrations' }

  # Colocar aqui todas las rutas de sign_up segun tipos de usuario
  devise_scope :user do 
    get '/developers/sign_up' => 'user_registrations#new', :user => { :profileable_type => 'Developer' }, :as => :new_developer_registration
    get '/sponsors/sign_up' => 'user_registrations#new', :user => { :profileable_type => 'Sponsor' }, :as => :new_sponsor_registration
  end
  
  resources :developers do
    collection do
      get 'dashboard'  => 'developers#dashboard', as: :dashboard
    end
  end

  resources :sponsors do
    collection do
      get 'dashboard'  => 'sponsors#dashboard', as: :dashboard
    end
  end

  resources :promos
  resources :behaviors


  get '/single_page' => 'general#single_page'
  get '/want_to_be_developer' => 'general#want_to_be_developer'
  get '/want_to_be_sponsor' => 'general#want_to_be_sponsor'
  get '/want_to_be_mentor' => 'general#want_to_be_mentor'

  get '/soon' => 'general#soon'
  root 'general#index'

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
