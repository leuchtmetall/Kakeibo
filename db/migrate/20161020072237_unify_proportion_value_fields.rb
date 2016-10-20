class UnifyProportionValueFields < ActiveRecord::Migration[5.0]
  def change
    remove_column :proportions, :relative_value, :integer
    rename_column :proportions, :absolute_value, :value
    change_column :proportions, :value, :string
  end
end
