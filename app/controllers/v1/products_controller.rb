class V1::ProductsController < ApplicationController
  def the_products
    products = Product.all
    
    render json: {}
  end

end 