Rails.application.routes.draw do

  get 'lead_form/new'
  get 'lead_form/create'

  get 'posts/index'
  get 'posts/new'
  get 'posts/edit'
  get 'posts/show'

  get 'events/index'
  get 'events/new'
  get 'events/show'
  get 'events/edit'

  get 'industry/accounting'
  get 'industry/agriculture'
  get 'industry/automotive'
  get 'industry/beverage'
  get 'industry/B2B'
  get 'industry/cafeandcoffee'
  get 'industry/care'
  get 'industry/chemical'
  get 'industry/childrenandbabies'
  get 'industry/cleaning'
  get 'industry/communications'
  get 'industry/computers'
  get 'industry/construction'
  get 'industry/consultancy'
  get 'industry/logistics'
  get 'industry/educationandtraining'
  get 'industry/electrical'
  get 'industry/entertainment'
  get 'industry/enviromental'
  get 'industry/estateagents'
  get 'industry/fashion'
  get 'industry/financial'
  get 'industry/food'
  get 'industry/health'
  get 'industry/hirerental'
  get 'industry/hospitality'
  get 'industry/indoorpropertyservices'
  get 'industry/outdoorpropertyservices'
  get 'industry/internet'
  get 'industry/legal'
  get 'industry/manafacture'
  get 'industry/pets'
  get 'industry/promotional'
  get 'industry/print'
  get 'industry/repairandmaintenance'

  get 'industry/investment1'
  get 'industry/investment2'
  get 'industry/investment3'
  get 'industry/investment4'

  get 'admin/overview'
  get 'admin/listings'
  get 'admin/events'
  get 'admin/moneyzone'

  resources :listings do
     member do
       post :leadcreate
       post :storycreate
     end
  end
  resources :admin

  resources :posts
  post 'posts/subscribe' => 'posts#subscribe'

  resources :events

  devise_for :admins
  root to: 'home#index'

  get 'home/index'
  get 'home/search'

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
