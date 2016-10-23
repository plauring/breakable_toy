class ChangeFavoriteTeamsTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :favorite_teams, :favorites
  end
end
