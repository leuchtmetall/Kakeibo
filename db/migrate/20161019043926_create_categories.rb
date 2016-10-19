class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :account_id

      t.timestamps
    end
    add_index :categories, :account_id
  end
end
