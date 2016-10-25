require 'rails_helper'

feature 'user sees the planned events for their favorite teams games' do
  scenario 'user visits home page and sees planned events for their teams games' do
    user = FactoryGirl.create(:user)
    conference = FactoryGirl.create(:conference)
    team1 = FactoryGirl.create(:team, conference: conference)
    team2 = FactoryGirl.create(:team, conference: conference)
    favorite1 = Favorite.create(user: user, team: team1)
    game1 = Game.create(week: 11, scheduled: "2016-10-29T19:30:00+00:00", network: 'ABC', home_team_id: team1.id, away_team_id: team2.id)
    event1 = FactoryGirl.create(:event, game: game1)
    login_as(user)
    visit root_path
    
    expect(page).to have_content(event1.name)
    expect(page).to have_content(event1.description)
    expect(page).to have_content(event1.location)
    expect(page).to have_content(event1.address)
    expect(page).to have_content(event1.city)
    expect(page).to have_content(event1.state)
    expect(page).to have_content(event1.zip)
  end
end
