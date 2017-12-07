Rails.application.routes.draw do

  namespace :v1 do 
    get '/all_products' => "products#the_products"
    get '/product' => 'products#one_product'
    get '/product_two' => 'products#two_products'
  end

  namespace :v2 do
    get '/products' => 'products#index'
    get '/products/:id' => 'products#show'
    post '/products' => 'products#create'
    delete '/products/:id' => 'products#destroy'
  end

end


