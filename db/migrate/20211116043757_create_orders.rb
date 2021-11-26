class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|

      t.integer :customer_id,  null: false
      t.string  :postal_code,  null: false
      t.string  :address,      null: false
      t.string  :name,         null: false
      t.integer :cost,         null: false
      t.integer :total_price,  null: false
      t.integer :payment_way,  null: false, default: "0"
      t.integer :status,       null: false, default: "0"
      t.timestamps
    end
  end
end
