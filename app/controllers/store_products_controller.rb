class StoreProductsController < ApplicationController
  def index
    @store = Store.find(params[:store_id])
    @products = @store.products
  end
end
