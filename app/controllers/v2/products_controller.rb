class V2::ProductsController < ApplicationController

  def toy
    item = toy['my_products']
    render json: {today: "monday"}
  end

  def index
    products = Product.all 
    render json: products.as_json
  end 
  def show
    the_id = params['id']
    product = Product.find_by(id: the_id)
    render json: product.as_json
  end
  def create
    product = Product.new(
      name: params['name'],
      price: params['price'],
      description: params['description'],
      image: params['image']
    )
    recipe.save

    render json: recipe.as_json
  end
  def update
    the_id = params['id']
    product = Product.find_by(id: the_id)
    product.name = params['name']
    product.price = params['price']
    product.description = params['description']
    product.image = params['image']
    product.save
    render json: product.as_json
  end
  def destroy
    the_id = params['id']
    product = Product.find_by(id: the_id)
    product.destroy
    render json: "You have deleted a product."
  end


end

