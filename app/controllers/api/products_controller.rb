class Api::ProductsController < ApplicationController

  def index
    @products = Product.all
    if params[:search]
      @products = @products.where("name iLIKE ?", "%#{params[:search]}%")
    end
    if params[:discount]
      @products = @products.where("price < ?", 20)
    end
    if params[:sort] == "price" && params[:sort_order] == "asc"
      @products = @products.all.order(:price)
    elsif params[:sort] == "price" && params[:sort_order] == "desc"
      @products = @products.all.order(price: :desc)
    else
      @products = @products.order(:id)
    end  
    @products = @products.order(:id)
    render 'index.json.jb'
  end

  def show
    @products = Product.all
    @product = @products.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      stock: params[:stock]
    )
    if @product.save
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.stock = params[:stock] || @product.stock
    if @product.save
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "Product has been deleted."}
  end

end
