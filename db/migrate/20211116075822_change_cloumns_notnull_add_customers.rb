class ChangeCloumnsNotnullAddCustomers < ActiveRecord::Migration[5.0]
  def change
    change_column :customers, :is_deleted,      :boolean, null: false, default: false
    change_column :customers, :last_name,       :string,  null: false
    change_column :customers, :first_name,      :string,  null: false
    change_column :customers, :last_name_kana,  :string,  null: false
    change_column :customers, :first_name_kana, :string,  null: false
    change_column :customers, :phone_number,    :string,  null: false
    change_column :customers, :postal_code,     :string,  null: false
    change_column :customers, :address,         :string,  null: false
  end
end
