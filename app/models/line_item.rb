# == Schema Information
#
# Table name: line_items
#
#  id       :integer          not null, primary key
#  quantity :integer
#  cart_id  :integer
#  item_id  :integer
#

class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item

  after_initialize :init

  def init
    self.quantity ||= 1 # will set the default value only if it's nil
  end

end
