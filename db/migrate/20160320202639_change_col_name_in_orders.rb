class ChangeColNameInOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :product_id, :tea_id
  end
end
