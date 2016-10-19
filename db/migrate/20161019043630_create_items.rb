class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :entry_id
      t.integer :category_id
      t.integer :amount

      t.timestamps
    end
    add_index :items, :entry_id
  end
end
