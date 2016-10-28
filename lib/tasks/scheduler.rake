desc "GET GAMES"

task :schedule => :environment do
  Game.schedule
end
