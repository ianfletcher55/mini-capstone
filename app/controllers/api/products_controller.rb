class Api::ProductsController < ApplicationController

  def all_products_action
    @all_products = Product.all
    render json: @all_products
  end
end
