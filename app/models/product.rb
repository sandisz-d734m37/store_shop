class Product < ApplicationRecord

  belongs_to :store

  def sale_status
    if on_sale
      "Sale is on"
    else
      "Sale is off"
    end
  end

  # def available_at(store_id)
  #   @store = Store.find(store_id)
  #
  #   @store.name
  # end

end
