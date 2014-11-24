class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, null: false
    add_column :users, :rank, :decimal
    add_column :users, :elo, :integer, null: false, default: 1400
    add_column :users, :bio, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
