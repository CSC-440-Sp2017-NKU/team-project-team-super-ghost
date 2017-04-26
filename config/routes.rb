Rails.application.routes.draw do
  # Base url
  root 'user_courses#index'

  # Users
  resources :users
  get '/signup' => 'users#new', as: 'new_users'
  post '/signup' => 'users#create', as: 'post_users'
  get '/users/:id' => 'users#show', as: 'show_user' # TODO: Not sure if this will work.

  # Sessions
  get '/login' => 'sessions#new', as: 'new_sessions'
  post '/login' => 'sessions#create', as: 'sessions'
  get '/logout' => 'sessions#destroy', as: 'destroy_sessions'

  # Posts and Comments
  resources :courses do
    resources :posts do
      member do
        get :upvote
        get :downvote
      end
      resources :comments do
        member do
          get :upvote
          get :downvote
        end
      end
    end
  end

  resources :user_courses
end

# EXAMPLES

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