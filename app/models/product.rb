class Product < ApplicationRecord

  validates_presence_of :name, :description, :price, :quantity

  belongs_to :store

  def available_online?
    if available_online
      "Available Online"
    else
      "Unvailable Online"
    end
  end

  def self.filter_by_quantity(num)
    where ("quantity >= #{num}")
  end

  # def self.search_by_name(input)
  #   find_by(name: "#{input}")
  # end
end
