require 'rails_helper'

describe Game do
  conference1 = FactoryGirl.create(:conference)

  # team2 = FactoryGirl.create(:team, conference: conference1)
  # game5 = FactoryGirl.build(:game, network: '', home_team_id: 'abc', away_team_id: team2.id)
  # game6 = FactoryGirl.build(:game, network: '', home_team_id: team1.id, away_team_id: 'abc')


  it 'is valid with valid attributes' do
    team1 = Team.create(name: 'Test', nickname: 'Turtles', conference: conference1, league: 'NCAAF', key: 'TTU')
    team2 = Team.create(name: 'Test2', nickname: 'Turtles2', conference: conference1, league: 'NCAAF', key: 'TTT')
    game1 = Game.create(week: 10, scheduled: 'noon', network: 'pbs', home_team_id: team1.id, away_team_id: team2.id)
    expect(game1).to be_valid
  end

  it 'is not valid without a week value as integer' do
    team1 = Team.create(name: 'Test', nickname: 'Turtles', conference: conference1, league: 'NCAAF', key: 'TTU')
    team2 = Team.create(name: 'Test2', nickname: 'Turtles2', conference: conference1, league: 'NCAAF', key: 'TTT')
    game2 = Game.create(week: 'abc', home_team_id: team1.id, away_team_id: team2.id)
    expect(game2).to_not be_valid
  end

  it 'is not valid without a scheduled data-time value' do
    team1 = Team.create(name: 'Test', nickname: 'Turtles', conference: conference1, league: 'NCAAF', key: 'TTU')
    team2 = Team.create(name: 'Test2', nickname: 'Turtles2', conference: conference1, league: 'NCAAF', key: 'TTT')
    game3 = Game.create(scheduled: '', home_team_id: team1.id, away_team_id: team2.id)
    expect(game3).to_not be_valid
  end

  it 'is not valid without a newtork' do
    team1 = Team.create(name: 'Test', nickname: 'Turtles', conference: conference1, league: 'NCAAF', key: 'TTU')
    team2 = Team.create(name: 'Test2', nickname: 'Turtles2', conference: conference1, league: 'NCAAF', key: 'TTT')
    game4 = Game.create(network: '', home_team_id: team1.id, away_team_id: team2.id)
    expect(game4).to_not be_valid
  end

  it 'is not valid without a home team id' do
    team2 = Team.create(name: 'Test2', nickname: 'Turtles2', conference: conference1, league: 'NCAAF', key: 'TTT')
    game5 = Game.create(network: '', home_team_id: 'abc', away_team_id: team2.id)
    expect(game5).to_not be_valid
  end

  it 'is not valid without a n away team id' do
    team1 = Team.create(name: 'Test', nickname: 'Turtles', conference: conference1, league: 'NCAAF', key: 'TTU')
    game6 = Game.create(network: '', home_team_id: team1.id, away_team_id: 'abc')
    expect(game6).to_not be_valid
  end
end
