class DeleteTeaIdAndQuantityColumnsFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :tea_id, :integer
    remove_column :orders, :quantity, :integer
  end
end
