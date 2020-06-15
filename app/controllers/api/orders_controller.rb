class Api::OrdersController < ApplicationController

  before_action :authenticate_user

  def create
    if current_user
      @product = Product.find_by(id: params[:product_id])
      @order = Order.new(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        subtotal: @product.price,
        tax: @product.tax,
        total: @product.total
      )
      render json: { order: @order }
    else
      render json: []
    end
  end

end
