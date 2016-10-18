# == Schema Information
#
# Table name: carts
#
#  id :integer          not null, primary key
#

class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    self.line_items.each do |line_item|
      total += line_item.item.price * line_item.quantity
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

  def change_inventory
    if self.status = "submitted"
      self.line_items.each do |line_item|
        line_item.item.inventory -= line_item.quantity
        line_item.item.save
      end
    end
  end

  def checkout
    remove_inventory
    user.remove_cart
    update(status: 'submitted')
  end

  def remove_inventory
    line_items.each do |line_item|
      line_item.item.remove(line_item.quantity)
    end
  end

end
