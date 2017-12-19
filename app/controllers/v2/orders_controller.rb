class V2::OrdersController < ApplicationController
  def create
    order = Order.new(
      product_id: params[:product_id], 
      quantity: params[:quantity],
      )
  end

end
