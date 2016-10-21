class AddTeamsKeyColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :key, :string, null: false
  end
end
