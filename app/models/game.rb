class Game < ActiveRecord::Base
  has_many :events
  belongs_to :home_team, class_name: "Team", foreign_key: :home_team_id
  belongs_to :away_team, class_name: "Team", foreign_key: :away_team_id

  validates :week, presence: true
  validates :scheduled, presence: true

  def matchup(game)
    "#{game.away_team.name} #{game.away_team.nickname} @ #{game.home_team.name} #{game.home_team.nickname} "
  end

  def format_time(game)
    game.scheduled.in_time_zone('Eastern Time (US & Canada)').strftime('%a %b %d %I:%M %p %Z')
  end

  def self.schedule
    url = "http://api.sportradar.us/ncaafb-t1/2016/REG/schedule.json?api_key=#{ENV['NCAAF_TOKEN']}"
    response = HTTParty.get(url)
    week_number = ''
    scheduled = ''
    home = ''
    away = ''
    network = ''
    response['weeks'].each do |week|
      if week['number'].to_i > 8
        week_number = week['number']
        week['games'].each do |game|
          scheduled = game['scheduled']
          home = game['home']
          away = game['away']
          if game['broadcast']
            network = game['broadcast']['network']
          else
            network = 'none'
          end
          home_team = Team.where(key: home)
          away_team = Team.where(key: away)
          Game.create(week: week_number, scheduled: scheduled, network: network, home_team_id: home_team.ids[0], away_team_id: away_team.ids[0])
        end
      end
    end
    puts "this is your rake task"
  end

end
