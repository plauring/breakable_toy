class CreateFavoriteTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_teams do |t|
      t.belongs_to :user, null: false
      t.belongs_to :team, null: false
      t.timestamps
    end
  end
end
