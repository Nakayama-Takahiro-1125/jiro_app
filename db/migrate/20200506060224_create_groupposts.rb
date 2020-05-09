class CreateGroupposts < ActiveRecord::Migration[5.1]
  def change
    create_table :groupposts do |t|
      t.references :group, foreign_key: true
      t.text :content
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
