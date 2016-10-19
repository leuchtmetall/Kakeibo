class CreateProportions < ActiveRecord::Migration[5.0]
  def change
    create_table :proportions do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :relative_value
      t.integer :absolute_value

      t.timestamps
    end
    add_index :proportions, :category_id
  end
end
