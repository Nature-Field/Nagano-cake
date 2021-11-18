class ChangeImageNullOnProduct < ActiveRecord::Migration[5.2]
  def change
    change_column_null :products, :image_id, from: false, to: true
  end
end
