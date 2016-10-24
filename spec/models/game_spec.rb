require 'rails_helper'

describe Game do
  conference1 = FactoryGirl.create(:conference)
  team1 = FactoryGirl.create(:team, conference: conference1)
  team2 = FactoryGirl.create(:team, conference: conference1)
  # binding.pry
  game1 = FactoryGirl.create(:game, home_team_id: team1.id, away_team_id: team2.id)
  game2 = FactoryGirl.build(:game, week: 'abc', home_team_id: team1.id, away_team_id: team2.id)
  game3 = FactoryGirl.build(:game, scheduled: '', home_team_id: team1.id, away_team_id: team2.id)
  game4 = FactoryGirl.build(:game, network: '', home_team_id: team1.id, away_team_id: team2.id)
  game5 = FactoryGirl.build(:game, network: '', home_team_id: 'abc', away_team_id: team2.id)
  game6 = FactoryGirl.build(:game, network: '', home_team_id: team1.id, away_team_id: 'abc')


  it 'is valid with valid attributes' do
    expect(game1).to be_valid
  end

  it 'is not valid without a week value as integer' do
    expect(game2).to_not be_valid
  end

  it 'is not valid without a scheduled data-time value' do
    expect(game3).to_not be_valid
  end

  it 'is not valid without a newtork' do
    expect(game4).to_not be_valid
  end

  it 'is not valid without a home team id' do
    expect(game5).to_not be_valid
  end
  it 'is not valid without a n away team id' do
    expect(game6).to_not be_valid
  end
end
