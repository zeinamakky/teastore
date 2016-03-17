class AddStockToTeas < ActiveRecord::Migration
  def change
    add_column :teas, :stock, :boolean, default: true
  end
end
