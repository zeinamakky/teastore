class CreateCategorizedTeas < ActiveRecord::Migration
  def change
    create_table :categorized_teas do |t|
      t.integer :tea_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
