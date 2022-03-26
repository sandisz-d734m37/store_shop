class Store < ApplicationRecord
  has_many :products

  def sale_status
    if sale == true
      return "Sale is on"
    else
      return "Sale is off"
    end
  end

  def product_count
    # product = Product.where(store_id: id)
    # product.length
    products.count
  end

    def self.first_to_last
      order(created_at: :desc)
    end
end
