class ChangeDescriptionAndPriceTypeInTeas < ActiveRecord::Migration
  def change
    change_column :teas, :price, :decimal, precision: 8, scale: 2
    change_column :teas, :description, :text

    you can also change doing this

    # change_table :teas do |t|
    #   t.change

    # end
  end
end
