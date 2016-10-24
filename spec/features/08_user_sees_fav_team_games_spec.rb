require 'rails_helper'

feature "user sees favorite team's games on the events index page" do
  scenario "user vists events index page and sees upcoming games for their favorite team" do
    user = FactoryGirl.create(:user)
    conference = FactoryGirl.create(:conference)
    team1 = FactoryGirl.create(:team, conference: conference)
    team2 = FactoryGirl.create(:team, conference: conference)
    favorite1 = Favorite.create(user: user, team: team1)
    favorite2 = Favorite.create(user: user, team: team2)
    game1 = FactoryGirl.create(:game, home_team_id: team1, away_team_id: team2)
    visit root_path
    expect(page).to have_content(game1.scheduled)
  end

end
