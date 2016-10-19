class CreateAccountMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :account_members do |t|
      t.integer :user_id
      t.integer :account_id
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :account_members, :user_id
    add_index :account_members, :account_id
  end
end
