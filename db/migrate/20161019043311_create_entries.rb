class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.integer :month
      t.datetime :time
      t.string :place

      t.timestamps
    end
    add_index :entries, :month
    add_index :entries, :time
  end
end
