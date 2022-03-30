class ProductsController < ApplicationController
  def index
    if params[:search_q].present?
      @products = Product.search_by_name(params[:search_q])
    else
      @products = Product.all
    end
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
