class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|

      t.integer :product_id
      t.integer :order_id
      t.integer :price
      t.integer :quantity
      t.integer :create_status
      t.timestamps
    end
  end
end
