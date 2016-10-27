desc "GET GAMES"

task :schedule => :environment do
  Game.schedule
  binding.pry
end
