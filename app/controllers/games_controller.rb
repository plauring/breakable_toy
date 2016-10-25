class GamesController < ApplicationController
  def create
    url = "http://api.sportradar.us/ncaafb-t1/2016/REG/schedule.json?api_key=#{ENV['NCAAF_TOKEN']}"
    response = HTTParty.get(url)
    week_number = ''
    scheduled = ''
    home = ''
    away = ''
    network = ''
    response['weeks'].each do |week|
      if week['number'].to_i > 8 && week['number'].to_i < 16
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
  end
end
