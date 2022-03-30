class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search_by_name(input)
    find_by(name: "#{input}")
  end
end
