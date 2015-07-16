class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone_number, :string
    add_index :users, :phone_number, unique: true
    add_column :users, :username, :string
    add_index :users, :username, unique: true
  end
end
