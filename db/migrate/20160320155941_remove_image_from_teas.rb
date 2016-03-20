class RemoveImageFromTeas < ActiveRecord::Migration
  def change
    remove_column :teas, :image, :string
  end
end
