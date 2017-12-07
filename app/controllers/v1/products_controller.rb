class V1::ProductsController < ApplicationController
  def the_products
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

end 