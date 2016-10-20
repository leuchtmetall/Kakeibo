class AddAccountIdToEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :account_id, :integer
  end
end
