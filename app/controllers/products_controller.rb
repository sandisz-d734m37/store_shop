class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
  end

  def create
    product = Product.new({
      name: params[:product][:name],
      description: params[:product][:description],
      price: params[:product][:price],
      quantity: params[:product][:quantity],
      available_online: params[:product][:available_online],
      store_id: params[:product][:store_id]
      })

    product.save

    redirect_to '/products'
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])

    product.update({
      name: params[:name],
      description: params[:description],
      price: params[:price],
      quantity: params[:quantity]
      })
    product.save
    redirect_to "/products/#{product.id}"
  end
end
