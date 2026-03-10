class MoveProfileColumnsToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :username, :string
    add_column :users, :picture, :string
    add_index :users, :username, unique: true

    drop_table :profiles
  end
end
