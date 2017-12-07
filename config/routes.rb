Rails.application.routes.draw do

  namespace :v2 do
    get '/products' => 'products#index'
    get '/products/:id' => 'products#show'
    post '/products' => 'products#create'
    delete '/products/:id' => 'products#destroy'
  end

end


