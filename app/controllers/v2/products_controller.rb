class V2::ProductsController < ApplicationController

  def index
    products = Product.all 
    render json: products.as_json
  end 
  
  def show
    the_id = params[:id]
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
    if product.save
      render json: product.as_json
    else
      render json: {errors: product.errors.full_messages}
    end
  end
  
  def update
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    product.name = params ['name']
    product.price = params['price']
    product.description = params['description']
    product.image = params['image']
   
    if product.save
      render json: product.as_json
    else
      render json: {errors: product.errors.full_messages}
    end
  end
  
  def destroy
    the_id = params['id']
    product = Product.find_by(id: the_id)
    product.destroy
    render json: "You have deleted a product."
  end

  def less_than_two
    less_than_two = Product.is_discounted
    render json: product.as_json
  end
end

