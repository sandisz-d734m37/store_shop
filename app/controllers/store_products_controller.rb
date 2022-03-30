class StoreProductsController < ApplicationController
  def index
    @store = Store.find(params[:store_id])
    if params[:product_quantity].present?
      @products = @store.products.filter_by_quantity(params[:product_quantity])
    elsif params[:sort_by] == "name-ascending"
      @products = @store.alphabetize_asc
    else
      @products = @store.products
    end
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
