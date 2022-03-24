class Store < ApplicationRecord
  def sale_status
    if sale == true
      return "Sale is on"
    else
      return "Sale is off"
    end
  end

  def product_count
    product = Product.where(store_id: id)
    product.length
  end
end
