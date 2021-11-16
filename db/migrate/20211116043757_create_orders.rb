class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.string  :postal_code
      t.string  :address
      t.string  :name
      t.integer :cost
      t.integer :total_price
      t.integer :payment_way
      t.integer :status
      t.timestamps
    end
  end
end
