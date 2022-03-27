class Product < ApplicationRecord

  belongs_to :store

  def available_online?
    if available_online
      "Available Online"
    else
      "Unvailable Online"
    end
  end
end
