# == Schema Information
#
# Table name: categories
#
#  id    :integer          not null, primary key
#  title :string
#

require 'rails_helper'

RSpec.describe Category, :type => :model do

  it 'has many items' do 
    Category.first.items << Item.first
    expect(Category.first.items).to include(Item.first)
  end
end
