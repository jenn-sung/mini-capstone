class V2::CartedProductsController < ApplicationController

  def index
    if current_user
      carted_products = CartedProduct.where(user_id: current_user.id)
      render json: carted_products.as_json
    else
      render json: carted_products.as_json
    end

  end
  def create
    carted_product = CartedProduct.new(
      status: 'carted',
      user_id: current_user.id,

      product_id: params['product_id'
      ],
      quantity: params['quantity']
      )
    if carted_product.save
      render json: carted_product.as_json
    else
      render json: {errors: carted_product.errors.full_messages}
    end
  end
end
