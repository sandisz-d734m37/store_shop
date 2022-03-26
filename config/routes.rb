Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/stores', to: 'stores#index'
  get '/stores/new', to: 'stores#new'
  post '/stores', to: 'stores#create'
  get '/stores/:id', to: 'stores#show'
  get '/stores/:id/edit', to: 'stores#edit'
  patch '/stores/:id', to: 'stores#update'

  get '/products', to: 'products#index'
  get '/products/new', to: 'products#new'
  post '/products', to: 'products#create'
  get '/products/:id', to: 'products#show'

  get '/stores/:store_id/products', to: 'store_products#index'
  get '/stores/:store_id/products/new', to: 'store_products#new'
  post '/stores/:store_id/products', to: 'store_products#create'
  get '/stores/:store_id/products/:product_id', to: 'store_products#show'
  get '/stores/:store_id/products/:product_id/edit', to: 'store_products#edit'
  patch '/stores/:store_id/products/:product_id', to: 'store_products#update'

end
