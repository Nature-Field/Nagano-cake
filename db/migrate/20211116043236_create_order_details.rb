class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|

      t.integer :product_id,     null: false
      t.integer :order_id,       null: false
      t.integer :price,          null: false
      t.integer :quantity,       null: false
      t.integer :create_status,  null: false
      t.timestamps
    end
  end
end
