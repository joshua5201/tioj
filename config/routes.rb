Tioj::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => {:registrations => "registrations"}
  #resources :limits
  resources :problems do
    resources :testdata
    resources :submissions
    resources :posts 
  end

  resources :judge_servers
  resources :submissions
  resources :users
  resources :posts do 
    resources :comments
  end
  
  resources :contests do
    resources :submissions
    resources :problems
  end
  resources :contest_problem_joints
  
  resources :articles
  
  get 'problems/tag/:tag' => 'problems#index', as: :problems_tag
  get 'problems/:id/ranklist' => 'problems#ranklist', as: :problem_ranklist
  
  get 'contests/:id/dashboard' => 'contests#dashboard'
  get 'submissions/:id/rejudge' => 'submissions#rejudge'
  get 'problems/:problem_id/rejudge' => 'submissions#rejudge_problem', as: :problem_rejudge
  
  get 'fetch/sjcode' => 'fetch#sjcode'
  get 'fetch/code' => 'fetch#code'
  get 'fetch/interlib' => 'fetch#interlib'
  get 'fetch/testdata' => 'fetch#testdata'
  get 'fetch/submission' => 'fetch#submission'
  get 'fetch/validating' => 'fetch#validating'
  get 'fetch/write_result' => 'fetch#write_result'
  get 'fetch/testdata_limit' => 'fetch#testdata_limit'
  get 'fetch/testdata_meta' => 'fetch#testdata_meta'
  
  mathjax 'mathjax'
  
  get 'about' => 'about#index', as: :about
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
