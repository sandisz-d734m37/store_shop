class StoresController < ApplicationController
  def index
    @stores = Store.first_to_last
  end

  def new
  end

  def create
    store = Store.new({
      name: params[:store][:name],
      description: params[:store][:description],
      address: params[:store][:address],
      rating: params[:store][:rating],
      sale: params[:store][:sale]
      })

    store.save

    redirect_to '/stores'
    # binding.pry
  end

  def show
    @store = Store.find(params[:id])
  end

  def edit_info
    @store = Store.find(params[:id])
  end

  def update
    store = Store.find(params[:id])
    store.update({
      name: params[:store][:name],
      description: params[:store][:description],
      address: params[:store][:address],
      rating: params[:store][:rating]
      })
    store.save
    redirect_to "/stores/#{store.id}"
  end
end
