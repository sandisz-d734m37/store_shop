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
    product = @store.products.create({
      name: params[:name],
      description: params[:description],
      price: params[:price],
      quantity: params[:quantity],
      available_online: params[:available_online],
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
    @store = Store.find(params[:store_id])
    @product = Product.find(params[:product_id])
  end

  def update
    store = Store.find(params[:store_id])
    product = Product.find(params[:product_id])

    product.update({
      name: params[:name],
      description: params[:description],
      price: params[:price],
      quantity: params[:quantity]
      })

    product.save

    redirect_to "/stores/#{store.id}/products/#{product.id}"
  end

  def destroy
    @store = Store.find(params[:store_id])

    Product.destroy(params[:product_id])

    redirect_to "/stores/#{@store.id}/products"
  end
end
