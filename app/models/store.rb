class Store < ApplicationRecord
  def sale_status
    if sale == true
      return "Sale is on"
    else
      return "Sale is off"
    end
  end
end
