require 'pry'
require 'HTTParty'
require 'json'

url = "http://api.sportradar.us/ncaafb-t1/2016/REG/schedule.json?api_key="
response = HTTParty.get(url)
week_number = ''
scheduled = ''
home = ''
away = ''
network = ''

response['weeks'].each do |week|
  if week['number'].to_i > 8 && week['number'].to_i < 10
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
      puts "Week #{week_number}, #{scheduled}, #{home}, #{away}, #{network}"
    end
  end
end
