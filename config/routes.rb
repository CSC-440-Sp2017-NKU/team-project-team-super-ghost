Rails.application.routes.draw do
  
  # TEMPORARY, used for making students from CSV document
  resources :documents do
      member do
          get :make_students_from_csv
      end
  end
  
  resources :documents
  # resources :documents
  
  # Base url
  root 'user_courses#index'

  # Users
  resources :users
  get '/signup' => 'users#new', as: 'new_users'
  post '/signup' => 'users#create', as: 'post_users'
  get '/users/:id' => 'users#show', as: 'show_user' # TODO: Not sure if this will work.
  post '/users/:id/upload' => 'users#upload', as: 'upload_user'

  # Sessions
  get '/login' => 'sessions#new', as: 'new_sessions'
  post '/login' => 'sessions#create', as: 'sessions'
  get '/logout' => 'sessions#destroy', as: 'destroy_sessions'
  
  #Registrar Pages
  get '/portal' => 'registrar_pages#home'
  get '/add-student-to-course' => 'registrar_pages#add_student_to_course', as: 'add_student_to_course'
  post '/add-student-to-course' => 'registrar_pages#post_add_student_to_course'

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