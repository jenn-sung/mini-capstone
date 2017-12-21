class V2::OrdersController < ApplicationController
  def create
    #product = Product.find_by(id: params[:product_id])
    calculated_subtotal = carted_product.price * params[:quantity]
    tax_rate = 0.09
    calculated_tax = calculated_subtotal * tax_rate
    calculated_total = calculated_tax + calculated_subtotal
    carted_products = CartedProduct.find_by(status: 'carted)') 
    
    order = Order.new(
      user_id: current_user.id,
      #carted_product_id: params[:product_id], 
      quantity: params[:quantity],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total]
      )
    if order.save
      render json: order.as_json
    else
      render json: {errors: order.errors.full_messages}
    end
  end
end
