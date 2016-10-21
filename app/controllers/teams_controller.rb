class TeamsController < ApplicationController

  def create
    url = 'http://api.sportradar.us/ncaafb-t1/teams/FBS/hierarchy.json?api_key='
    response = HTTParty.get(url)
    conf = ''
    team_name = ''
    nickname = ''
    key = ''

    response['conferences'].each do |conferences|
      conf = conferences['id']
      if conferences['subdivisions'].nil?
        conferences['teams'].each do |team|
          team_name = team['name']
          nickname = team['market']
          key = team['id']
          Team.create(name: team_name, nickname: nickname, key: key, conference: conf, league: 'NCAAF')
        end
      else
        conferences['subdivisions'].each do |subdivision|
          subdivision['teams'].each do |team|
            team_name = team['name']
            nickname = team['market']
            key = team['id']
            Team.create(name: team_name, nickname: nickname, key: key, conference: conf, league: 'NCAAF')
          end
        end
      end
    end
  end

end
