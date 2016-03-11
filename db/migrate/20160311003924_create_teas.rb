class CreateTeas < ActiveRecord::Migration
  def change
    create_table :teas do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.text :reviews
      t.string :stars
      t.string :image

      t.timestamps null: false
    end
  end
end
