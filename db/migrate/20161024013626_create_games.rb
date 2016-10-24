class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :week, null: false
      t.string :scheduled, null: false
      t.string :network
      t.belongs_to :home_team, class_name: 'Team', null: false
      t.belongs_to :away_team, class_name: 'Team', null: false
    end
  end
end
