class AddSupplierIdToTeas < ActiveRecord::Migration
  def change
    add_column :teas, :supplier_id, :integer
  end
end
