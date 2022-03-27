class Product < ApplicationRecord

  belongs_to :store

  def available_online?
    if available_online
      "Available Online"
    else
      "Unvailable Online"
    end
  end

  # def available_at(store_id)
  #   @store = Store.find(store_id)
  #
  #   @store.name
  # end

end
