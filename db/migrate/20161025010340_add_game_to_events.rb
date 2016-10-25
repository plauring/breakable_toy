class AddGameToEvents < ActiveRecord::Migration[5.0]
  def up
    add_belongs_to :events, :game, foreign_key: true, null: false
  end

  def down
    remove_belongs_to :events, :game, foreign_key: true, null: false
  end
end
