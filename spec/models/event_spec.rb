require 'rails_helper'

describe Event do
  conference1 = FactoryGirl.create(:conference)
  team1 = Team.create(name: 'Test', nickname: 'Turtles', conference: conference1, league: 'NCAAF', key: 'TTU')
  team2 = Team.create(name: 'Test2', nickname: 'Turtles2', conference: conference1, league: 'NCAAF', key: 'TTT')
  game1 = Game.create(week: 10, scheduled: 'noon', network: 'pbs', home_team_id: team1.id, away_team_id: team2.id)
  event1 = FactoryGirl.create(:event, game: game1)
  event2 = FactoryGirl.build(:event, game: game1, name: '')
  event3 = FactoryGirl.build(:event, game: game1, description: '')
  event4 = FactoryGirl.build(:event, game: game1, location: '')
  event5 = FactoryGirl.build(:event, game: game1, city: '')
  event6 = FactoryGirl.build(:event, game: game1, state: '')
  event7 = FactoryGirl.build(:event, game: game1, zip: '')

  it 'is valid with valid attributes' do
    expect(event1).to be_valid
  end

  it 'is not valid without a name' do
    expect(event2).to_not be_valid
  end

  it 'is not valid without a description' do
    expect(event3).to_not be_valid
  end

  it 'is not valid without a location' do
    expect(event4).to_not be_valid
  end

  it 'is not valid without a city' do
    expect(event5).to_not be_valid
  end

  it 'is not valid without a state' do
    expect(event6).to_not be_valid
  end
  it 'is not valid without a zip' do
    expect(event7).to_not be_valid
  end
end
