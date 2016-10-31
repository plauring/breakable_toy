require 'rails_helper'

feature "user sees favorite team's games on the events index page" do
  scenario "user vists events index page and sees upcoming games and game details for their favorite teams" do
    user = FactoryGirl.create(:user)
    conference = FactoryGirl.create(:conference)
    team1 = FactoryGirl.create(:team, conference: conference)
    team2 = FactoryGirl.create(:team, conference: conference)
    favorite1 = Favorite.create(user: user, team: team1)
    favorite2 = Favorite.create(user: user, team: team2)
    game1 = Game.create(week: 11, scheduled: "2016-10-29T19:30:00+00:00", network: 'ABC', home_team_id: team1.id, away_team_id: team2.id)
    login_as(user)
    visit root_path

    expect(page).to have_content(game1.format_time(game1))
    expect(page).to have_content(game1.network)
    expect(page).to have_content(team1.name)
    expect(page).to have_content(team2.name)
  end

  scenario "user vists events index page and sees only upcoming games for their favorite teams" do
    user = FactoryGirl.create(:user)
    conference = FactoryGirl.create(:conference)
    team1 = FactoryGirl.create(:team, conference: conference)
    team2 = FactoryGirl.create(:team, conference: conference)
    game1 = Game.create(week: 11, scheduled: "2016-10-29T19:30:00+00:00", network: 'ABC', home_team_id: team1.id, away_team_id: team2.id)
    login_as(user)
    visit root_path

    expect(page).to_not have_content(game1.format_time(game1))
    expect(page).to_not have_content(game1.network)
    expect(page).to_not have_content(team1.name)
    expect(page).to_not have_content(team2.name)
  end
end
