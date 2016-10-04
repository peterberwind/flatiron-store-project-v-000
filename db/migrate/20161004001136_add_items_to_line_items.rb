class AddItemsToLineItems < ActiveRecord::Migration
  def change
    add_reference :line_items, :item, index: true
    add_foreign_key :line_items, :items
  end
end
