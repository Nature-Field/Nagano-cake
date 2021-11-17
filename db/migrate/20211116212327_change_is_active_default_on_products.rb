class ChangeIsActiveDefaultOnProducts < ActiveRecord::Migration[5.0]
  def change
    change_column_default :products, :is_active, from: false, to: true
  end
end
