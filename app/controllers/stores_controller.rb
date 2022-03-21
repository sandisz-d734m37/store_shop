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
end
