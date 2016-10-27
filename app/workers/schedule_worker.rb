class ScheduleWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable
  sidekiq_options retry: false

  recurrence { weekly }

  def perform
    @games = Game.all
    @games.each do |g|
      url = "http://api.sportradar.us/ncaafb-t1/2016/REG/schedule.json?api_key=#{ENV['NCAAF_TOKEN']}"
      response = HTTParty.get(url)
      week_number = ''
      scheduled = ''
      home = ''
      away = ''
      channel = ''
      response['weeks'].each do |week|
        if week['number'].to_i > 8
          week_number = week['number']
          week['games'].each do |game|
            scheduled = game['scheduled']
            home = game['home']
            away = game['away']
            if game['broadcast']
              channel = game['broadcast']['network']
            else
              channel = 'none'
            end
            home_team = Team.where(key: home)
            away_team = Team.where(key: away)
            if g.week == week_number && g.home_team_id = home_team.ids[0] && g.away_team_id == away_team.ids[0]
              Game.update(scheduled: scheduled, network: channel, home_team_id: home_team.ids[0], away_team_id: away_team.ids[0])
            end
          end
        end
      end
    end
  end
end
