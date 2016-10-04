class Item < ActiveRecord::Base
  belongs_to :category
  # has many line_items consolidated by line_item quantity
  has_many :line_items

  def self.available_items
    where('inventory > ?', 0)
  end
end
