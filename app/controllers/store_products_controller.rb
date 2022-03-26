class StoreProductsController < ApplicationController
  def index
    @store = Store.find(params[:store_id])
    @products = @store.products
  end

  def new
    @store = Store.find(params[:store_id])
  end

  def create
    @store = Store.find(params[:store_id])
    # binding.pry
    product = @store.products.create({
      name: params[:name],
      description: params[:description],
      price: params[:price],
      quantity: params[:quantity],
      on_sale: params[:on_sale],
      store_id: params[:store_id],
    })

    product.save

    redirect_to "/stores/#{@store.id}/products"
  end

  def show
    @store = Store.find(params[:store_id])
    @product = Product.find(params[:product_id])
  end

  def edit
    # binding.pry
    @store = Store.find(params[:store_id])
    @product = Product.find(params[:product_id])
  end

  def update
    store = Store.find(params[:store_id])
    product = Product.find(params[:product_id])
    # binding.pry
    product.update({
      name: params[:name],
      description: params[:description],
      price: params[:price],
      quantity: params[:quantity]
      })
    product.save
    redirect_to "/stores/#{store.id}/products/#{product.id}"
  end
end
