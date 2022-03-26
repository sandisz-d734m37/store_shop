Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/stores', to: 'stores#index'
  get '/stores/new', to: 'stores#new'
  post '/stores', to: 'stores#create'
  get '/stores/:id', to: 'stores#show'
  get '/stores/:id/edit_info', to: 'stores#edit_info'
  patch '/stores/:id', to: 'stores#update'

  get '/products', to: 'products#index'
  get '/products/new', to: 'products#new'
  post '/products', to: 'products#create'
  get '/products/:id', to: 'products#show'

  get '/stores/:store_id/products', to: 'store_products#index'
end
