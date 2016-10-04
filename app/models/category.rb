# == Schema Information
#
# Table name: categories
#
#  id    :integer          not null, primary key
#  title :string
#

class Category < ActiveRecord::Base
  has_many :items

  def self.available_items
    #code
  end
end
