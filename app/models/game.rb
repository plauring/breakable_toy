class Game < ActiveRecord::Base
  has_many :events
  belongs_to :home_team, class_name: "Team", foreign_key: :home_team_id
  belongs_to :away_team, class_name: "Team", foreign_key: :away_team_id

  validates :week, presence: true
  validates :scheduled, presence: true

  def home_team
    @home_team = Team.where('id = ?', home_team_id )
    @home_team[0]
  end

  def away_team
    @away_team = Team.where('id = ?', away_team_id )
    @away_team[0]
  end

  def format_time(game)
    game.scheduled.in_time_zone('Eastern Time (US & Canada)').strftime('%a %b %d %I:%M %p %Z')
  end

end
