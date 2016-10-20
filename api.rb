require 'pry'
require 'HTTParty'
require 'json'

url = 'http://api.sportradar.us/ncaafb-t1/teams/FBS/hierarchy.json?api_key=z9c7ce23mnr6t5nq63hn29ak'
response = HTTParty.get(url)
conf = ''
team_name = ''
nickname = ''
# data = File.read("./teams.json")
# response = JSON.parse(data)
# binding.pry
response['conferences'].each do |conferences|
  conf = conferences['id']
  # binding.pry
  if conferences['subdivisions'].nil?
    conferences['teams'].each do |team|
      team_name = team['name']
      nickname = team['market']
      puts conf
      puts team_name
      puts nickname
    end
  else
    conferences['subdivisions'].each do |subdivision|
      subdivision['teams'].each do |team|
        team_name = team['name']
        nickname = team['market']
        puts conf
        puts team_name
        puts nickname
      end
    end
  end
end
