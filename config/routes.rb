Rails.application.routes.draw do

  
  namespace :v1 do 
    get '/all_products' => "products#products"
    get '/product' => 'products#one_product'
    get '/product_two' => 'products#two_products'
    get '/show_product' => 'products#show'
    get '/one_of_products/:id' => 'products#segment/'
  end

  namespace :v2 do
    get '/products' => 'products#index'
    get '/products/:id' => 'products#show'
    post '/products' => 'products#create'
    delete '/products/:id' => 'products#destroy'
    patch '/products/:id' => 'products#update'
    
    get '/suppliers'  => 'suppliers#index'
    get '/suppliers' => 'suppliers#create'
    get '/suppliers/:id' => 'suppliers#show'
    patch '/suppliers/:id' => 'suppliers#update'
    delete '/suppliers/:id' => 'suppliers#destroy'

    post '/user_token' => 'user_token#create'
    post '/users' => 'users#create'
  end

end



