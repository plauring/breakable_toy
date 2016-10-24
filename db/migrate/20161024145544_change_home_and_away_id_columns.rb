class ChangeHomeAndAwayIdColumns < ActiveRecord::Migration[5.0]
  def change
    change_column :games, :home_team_id, :integer, null: false
    change_column :games, :away_team_id, :integer, null: false
  end
end
