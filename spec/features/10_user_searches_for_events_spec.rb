require 'rails_helper'

feature 'user can search for events from index page' do
  scenario "user visits index page and searches for an event by city" do
    user1 = FactoryGirl.create(:user)
    conference1 = FactoryGirl.create(:conference)
    team1 = Team.create(name: 'Test', nickname: 'Turtles', conference: conference1, league: 'NCAAF', key: 'TTU')
    team2 = Team.create(name: 'Test2', nickname: 'Turtles2', conference: conference1, league: 'NCAAF', key: 'TTT')
    game1 = Game.create(week: 10, scheduled: '2016-10-29T19:30:00+00:00', network: 'pbs', home_team_id: team1.id, away_team_id: team2.id)
    event = FactoryGirl.create(:event, game: game1)
    login_as(user1)
    visit events_path
    fill_in 'search', with: event.city
    click_button 'Search'
    expect(page).to have_content(event.name)
    expect(page).to have_content(event.full_address)
  end
  scenario "user visits index page and searches for an event by name" do
    user1 = FactoryGirl.create(:user)
    conference1 = FactoryGirl.create(:conference)
    team1 = Team.create(name: 'Test', nickname: 'Turtles', conference: conference1, league: 'NCAAF', key: 'TTU')
    team2 = Team.create(name: 'Test2', nickname: 'Turtles2', conference: conference1, league: 'NCAAF', key: 'TTT')
    game1 = Game.create(week: 10, scheduled: '2016-10-29T19:30:00+00:00', network: 'pbs', home_team_id: team1.id, away_team_id: team2.id)
    event = FactoryGirl.create(:event, game: game1)
    login_as(user1)
    visit events_path
    fill_in 'search', with: event.name
    click_button 'Search'
    expect(page).to have_content(event.name)
    expect(page).to have_content(event.full_address)
  end
  scenario "user visits index page and searches for an event by partial description" do
    user1 = FactoryGirl.create(:user)
    conference1 = FactoryGirl.create(:conference)
    team1 = Team.create(name: 'Test', nickname: 'Turtles', conference: conference1, league: 'NCAAF', key: 'TTU')
    team2 = Team.create(name: 'Test2', nickname: 'Turtles2', conference: conference1, league: 'NCAAF', key: 'TTT')
    game1 = Game.create(week: 10, scheduled: '2016-10-29T19:30:00+00:00', network: 'pbs', home_team_id: team1.id, away_team_id: team2.id)
    event = FactoryGirl.create(:event, game: game1)
    login_as(user1)
    visit events_path
    fill_in 'search', with: 'Team B'
    click_button 'Search'
    expect(page).to have_content(event.name)
    expect(page).to have_content(event.full_address)
  end

  scenario "user visits index page and searches for non-existent event" do
    user1 = FactoryGirl.create(:user)
    login_as(user1)
    visit events_path
    fill_in 'search', with: 'Basketball'
    click_button 'Search'
    expect(page).to_not have_content('Basketball')
  end
end
