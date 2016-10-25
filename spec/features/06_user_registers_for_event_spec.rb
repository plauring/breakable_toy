require 'rails_helper'

feature 'Authorized users can register for an event' do
  scenario 'user visits event show page and registers for event' do
    user1 = FactoryGirl.create(:user)
    conference1 = FactoryGirl.create(:conference)
    team1 = Team.create(name: 'Test', nickname: 'Turtles', conference: conference1, league: 'NCAAF', key: 'TTU')
    team2 = Team.create(name: 'Test2', nickname: 'Turtles2', conference: conference1, league: 'NCAAF', key: 'TTT')
    game1 = Game.create(week: 10, scheduled: 'noon', network: 'pbs', home_team_id: team1.id, away_team_id: team2.id)
    login_as(user1)
    event1 = FactoryGirl.create(:event, game: game1)
    visit event_path(event1.id)
    click_button 'Attend'
    expect(page).to have_content(user1.username)
  end

  scenario 'multiple users register for the same event' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    user3 = FactoryGirl.create(:user)
    conference1 = FactoryGirl.create(:conference)
    team1 = Team.create(name: 'Test', nickname: 'Turtles', conference: conference1, league: 'NCAAF', key: 'TTU')
    team2 = Team.create(name: 'Test2', nickname: 'Turtles2', conference: conference1, league: 'NCAAF', key: 'TTT')
    game1 = Game.create(week: 10, scheduled: 'noon', network: 'pbs', home_team_id: team1.id, away_team_id: team2.id)
    event2 = FactoryGirl.create(:event, game: game1)
    login_as(user1)
    visit event_path(event2.id)
    click_button 'Attend'
    logout(:user)
    login_as(user2)
    click_button 'Attend'
    logout(:user)
    login_as(user3)
    click_button 'Attend'
    expect(page).to have_content(user1.username)
    expect(page).to have_content(user2.username)
    expect(page).to have_content(user3.username)
  end
end
