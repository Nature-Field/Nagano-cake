class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      
      t.integer :genre_id
      t.boolean :is_active
      t.string  :name
      t.text    :explanation
      t.integer :price
      t.string  :image_id
      t.timestamps
    end
  end
end
