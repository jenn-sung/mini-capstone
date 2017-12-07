class V1::ProductsController < ApplicationController
  def the_products
    params["message"]
    products = Product.all
    render json: product.as_json
  end

  def one_product
    product = Product.first
    render json: product.as_json
  end

  def two_product
    product_two = Product.second
    render json: product.as_json
  end

  def show
    product_name + params['name']
    product = Product.find_by(name: product_name)
    render json: product.as_json
  end

  def segment
    the_id = params['id']
    product = Product.find_by(id: the_id)
    render json: product.as_json
  end
end   