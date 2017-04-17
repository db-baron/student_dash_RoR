Rails.application.routes.draw do
  root "dojos#index"
  resources :dojos

# student only routes
  get "students/show"
  get "students/edit"
  get "students/new"

# Joined student/dojo routes
  get '/dojos/:dojo_id/students/:student_id/edit' => 'students#edit'

  get '/dojos/:dojo_id/students/new' => 'students#new'

  get '/dojos/:dojo_id/students/:student_id' => 'students#show'

  get '/dojos/:dojo_id/students' => 'students#index'

  post "/dojos/:dojo_id/students" => "students#create"

  put '/dojos/:dojo_id/students/:student_id' => 'students#update'

  delete '/dojos/:dojo_id/students/:student_id' => 'students#destroy'
end

#### The Dojo Routes Written Manually ###

  # get "/dojos/new" => "dojos#new"
  # get "/dojos/:dojo_id" => "dojos#show"
  # get "/dojos" => 'dojos#index'
  # post "/dojos" => "dojos#create"
  # get "/dojos/:dojo_id/edit" => "dojos#edit"
  # put "/dojos/:dojo_id" => "dojos#update"
  # delete "/dojos/:dojo_id" => "dojos#destroy"








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
