class Store < ApplicationRecord
  validates_presence_of :name, :description, :address, :rating

  has_many :products, dependent: :destroy

  def sale_status
    if sale
      return "Sale is on"
    else
      return "Sale is off"
    end
  end

  def product_count
    products.count
  end

  def self.first_to_last
    order(created_at: :desc)
  end

  def alphabetize_asc
    products.order(name: :asc)
  end
end
