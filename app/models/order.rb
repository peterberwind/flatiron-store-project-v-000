# == Schema Information
#
# Table name: orders
#
#  id :integer          not null, primary key
#

class Order < ActiveRecord::Base
  belongs_to :user

end
