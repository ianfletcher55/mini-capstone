class Api::ProductsController < ApplicationController

  def all_products_action
    @all_products = Product.all
    render json: @all_products
  end

  def get_guitar_strings
    @guitar_strings = Product.find_by(id: 1)
    render json: @guitar_strings
  end

  def get_guitar_case
    @guitar_case = Product.find_by(id: 2)
    render json: @guitar_case
  end

  def get_jazzmaster_guitar
    @jazzmaster_guitar = Product.find_by(id: 3)
    render json: @jazzmaster_guitar
  end

end
