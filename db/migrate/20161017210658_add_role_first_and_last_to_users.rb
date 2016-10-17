class AddRoleFirstAndLastToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :role, :string, null: false, default: 'member'
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
  end
end
