class AddExpToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :exp, :integer
  end
end
