class Cart < ActiveRecord::Base
  has_many :line_ites
  has_many :items, through: :line_ites

  def total
    #code
  end

  def add_item(item) # is this a instance or class method?
    #code
  end

end
