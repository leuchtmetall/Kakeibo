class CreateAmounts < ActiveRecord::Migration[5.0]
  def change
    create_table :amounts do |t|
      t.integer :cost
      t.integer :paid
      t.integer :user_id
      t.integer :entry_id

      t.timestamps
    end
    add_index :amounts, :entry_id
  end
end
