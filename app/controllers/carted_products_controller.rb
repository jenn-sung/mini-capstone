class CartedProductsController < ApplicationController

  def create
    cartedproduct = CartedProduct.new(
      product_id: params['product_id'
      ],
      quantity: params['quantity']
      )
    if cartedproduct.save
      render json: cartedproduct.as_json
    else
      render json: {errors: cartedproduct.errors.full_messages}
    end
  end
end
