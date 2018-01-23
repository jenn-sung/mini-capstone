
class V2::ProductsController < ApplicationController

  def index
    products = Product.all
    render json: products.as_json
    # category = Category.find_by(id: params[:category_id_input])
    # products = category.products
  end 
  
  def show
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    render json: product.as_json
  end
  
  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      # supplier: params[:supplier]
      # image: params['image']
    )
    product.save!
    render json: product.as_json
  end
  
  def update
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    if product.update(
      name: params['name'],
      price: params['price'],
      description: params['description'],
      supplier: params['supplier']
      # image: params['image']
      )
      render json: product.as_json
    else
      render json: {errors: product.errors.full_messages}
    end
  end
  
  def destroy
    the_id = params['id']
    product = Product.find_by(id: the_id)
    product.destroy
    render json: {message: "You have deleted a product."}
  end
end
