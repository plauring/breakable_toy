class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :nickname, null: false
      t.belongs_to :conference, null: false
      t.string :league, null: false
    end
  end
end
