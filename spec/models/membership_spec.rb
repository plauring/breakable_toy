require 'rails_helper'

describe Membership do
  it 'is valid with valid attributes' do
    user1 = FactoryGirl.create(:user)
    conference1 = FactoryGirl.create(:conference)
    team1 = Team.create(name: 'Test', nickname: 'Turtles', conference: conference1, league: 'NCAAF', key: 'TTU')
    team2 = Team.create(name: 'Test2', nickname: 'Turtles2', conference: conference1, league: 'NCAAF', key: 'TTT')
    game1 = Game.create(week: 10, scheduled: 'noon', network: 'pbs', home_team_id: team1.id, away_team_id: team2.id)
    event1 = FactoryGirl.create(:event, game: game1)
    if user1.save && event1.save
      expect(Membership.new(user_id: user1.id, event_id: event1.id)).to be_valid
    end
  end
end
