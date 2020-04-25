class AddExpSumToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :exp_sum, :integer, default: 0
  end
end
