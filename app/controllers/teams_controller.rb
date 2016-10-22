class TeamsController < ApplicationController

  def index
    @teams = Team.all
    @user = current_user
    @favorite_team = FavoriteTeams.new
  end

  def create
    url = "http://api.sportradar.us/ncaafb-t1/teams/FBS/hierarchy.json?api_key=#{ENV["NCAAF_TOKEN"]}"
    response = HTTParty.get(url)
    conf = ''
    team_name = ''
    nickname = ''
    key = ''
    cid = ''

    response['conferences'].each do |conferences|
      conf = conferences['id']
      if conferences['subdivisions'].nil?
        conferences['teams'].each do |team|
          team_name = team['name']
          nickname = team['market']
          key = team['id']
          cid = Conference.find_by(name: conf)
          Team.create(name: team_name, nickname: nickname, key: key, conference_id: cid.id, league: 'NCAAF')
        end
      else
        conferences['subdivisions'].each do |subdivision|
          subdivision['teams'].each do |team|
            team_name = team['name']
            nickname = team['market']
            key = team['id']
            cid = Conference.find_by(name: conf)
            Team.create(name: team_name, nickname: nickname, key: key, conference_id: cid.id, league: 'NCAAF')
          end
        end
      end
    end
  end

end
