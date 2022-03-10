class AddIsValidToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :is_valid, :boolean, default: true, null: false
    add_column :customers, :is_deleted, :boolean, default: false, null: false
  end
end
