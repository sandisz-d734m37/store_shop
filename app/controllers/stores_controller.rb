class StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def new
  end

  def create
    store = Store.new({
      name: params[:store][:name],
      description: params[:store][:description]
      })

    store.save

    redirect_to '/stores'
    # binding.pry
  end

  def find_id
    @store = Store.find(params[:id])
  end

  def edit_info
    @store = Store.find(params[:id])
  end

  def update
    store = Store.find(params[:id])
    store.update({
      name: params[:store][:name],
      description: params[:store][:description]
      })
    store.save
    redirect_to "/stores/#{store.id}"
  end
end
