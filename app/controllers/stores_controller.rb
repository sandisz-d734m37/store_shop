class StoresController < ApplicationController
  def index
    @stores = Store.first_to_last
  end

  def new
  end

  def create
    store = Store.new({
      name: params[:name],
      description: params[:description],
      address: params[:address],
      rating: params[:rating],
      sale: params[:sale]
      })

    store.save

    redirect_to '/stores'
  end

  def show
    @store = Store.find(params[:id])
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    store = Store.find(params[:id])
    store.update({
      name: params[:name],
      description: params[:description],
      address: params[:address],
      rating: params[:rating]
      })
    store.save
    redirect_to "/stores/#{store.id}"
  end
end
