class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      
      t.integer :genre_id,    null: false
      t.boolean :is_active,   null: false, default: false
      t.string  :name,        null: false
      t.text    :explanation, null: false
      t.integer :price,       null: false
      t.string  :image_id,    null: false
      t.timestamps
    end
  end
end
