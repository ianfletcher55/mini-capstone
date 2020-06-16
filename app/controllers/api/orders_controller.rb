class Api::OrdersController < ApplicationController

  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render "index.json.jb"
  end
  
  def create
    carted_products = current_user.carted_products.where(status: "carted")

    calc_subtotal = 0
    carted_products.each do |carted_product|
      calc_subtotal += carted_product.product.price * carted_product.quantity
    end
    calc_tax = calc_subtotal * 0.09
    calc_total = calc_subtotal + calc_tax
    @order = Order.new(
      user_id: current_user.id,
      subtotal: calc_subtotal,
      tax: calc_tax,
      total: calc_total
    )
    if @order.save
      # update carted products
      carted_products.update_all(order_id: @order.id, status: "purchased")
      render "show.json.jb"
    else
      render json: {errors: @order.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @order = Order.find(params[:id])
    render "show.json.jb"
  end

  def destroy
    @carted_product = current_user.carted_products.find_by(id: params[:id], status: "carted")
    @carted_product.update(status: "removed")
    render json: {status: "Carted product removed" }
  end

end
