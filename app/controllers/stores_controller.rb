class StoresController < ApplicationController
  def index
    if params[:search_q].present?
      @stores = Store.search_by_name(params[:search_q])
    else
      @stores = Store.first_to_last
    end
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
      rating: params[:rating],
      sale: params[:sale]
      })
    store.save
    redirect_to "/stores/#{store.id}"
  end

  def destroy
    Store.destroy(params[:id])
    redirect_to "/stores"
  end
end
