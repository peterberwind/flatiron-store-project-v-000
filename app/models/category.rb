class Category < ActiveRecord::Base
  has_many :items

  def self.available_items
    #code
  end
end
