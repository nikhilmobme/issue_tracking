Rails.application.routes.draw do
  root 'employees#index'
  get 'employee_login', to: 'employees#employee_login'
  post 'create_login', to: 'employees#create_login'
  get  'employee_logout', to: 'employees#employee_logout'
  get 'new_query',to: 'user_queries#new_query'
  post 'add_query',to: 'user_queries#add_query'
  get 'display_query', to:'user_queries#display_query'
  get 'view_query', to:'user_queries#view_query'
  post 'save_reply', to: 'replies#save_reply'
  post 'save_owner', to: 'replies#save_owner'
  get 'onhold_status', to: 'replies#onhold_status'
  get 'view_reply', to: 'user_queries#view_reply'
  get 'view_details', to: 'user_queries#view_details'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
