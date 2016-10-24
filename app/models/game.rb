class Game < ActiveRecord::Base
  has_many :events
  belongs_to :home_team, class_name: "Team", foreign_key: :home_team_id
  belongs_to :away_team, class_name:"Team", foreign_key: :away_team_id

  validates :week, presence: true
  validates :scheduled, presence: true

end
