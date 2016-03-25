class CreateCartedTeas < ActiveRecord::Migration
  def change
    create_table :carted_teas do |t|
      t.integer :user_id
      t.integer :tea_id
      t.integer :quantity
      t.string :status
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
