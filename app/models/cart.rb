# == Schema Information
#
# Table name: carts
#
#  id :integer          not null, primary key
#

class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_ites
  has_many :items, through: :line_ites

  def total
    total = 0
    self.line_items.each do |line_item|
      total += line_item.price * line_item.quantity
    end
    return total
  end

  def add_item(item_id)
    line_item = self.line_items.find_by(item_id: item_id)
    # if found, add item qty
    if line_item
      line_item.quantity += 1
    # otherwise
    else
      line_item=self.line_items.build(item_id: item_id)
    end
    return line_item
  end

  def checkout
    #code
  end

  def remove_inventory
    #code
  end

end
