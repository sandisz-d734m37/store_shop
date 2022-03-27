class ProductsController < ApplicationController
  def index
    @products = Product.all
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
      quantity: params[:quantity],
      available_online: params[:available_online]
      })
    product.save
    redirect_to "/products/#{product.id}"
  end

  def destroy
    Product.destroy(params[:id])
    redirect_to "/products"
  end
end
