class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.references :cart, index: true
    end
    add_foreign_key :line_items, :carts
  end
end
