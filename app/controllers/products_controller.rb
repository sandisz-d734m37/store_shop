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
      on_sale: params[:product][:on_sale],
      store_id: params[:product][:store_id]
      })

    product.save

    redirect_to '/products'
  end

  def find_id
    @product = Product.find(params[:id])
  end
end
