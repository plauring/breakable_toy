require 'rails_helper'

feature 'as an authenticated user I can create an event' do
  before do
    user1 = FactoryGirl.create(:user)
    # game1 = FactoryGirl.create(:game)

    login_as(user1, scope: :user)
  end

  scenario 'The new event page shows the correct form fields' do
    conference1 = FactoryGirl.create(:conference)
    team1 = Team.create(name: 'Test', nickname: 'Turtles', conference: conference1, league: 'NCAAF', key: 'TTU')
    team2 = Team.create(name: 'Test2', nickname: 'Turtles2', conference: conference1, league: 'NCAAF', key: 'TTT')
    game1 = Game.create(week: 10, scheduled: 'noon', network: 'pbs', home_team_id: team1.id, away_team_id: team2.id)
    visit new_game_event_path(game1.id)

    expect(page).to have_content('Name')
    expect(page).to have_content('Description')
    expect(page).to have_content('Location')
    expect(page).to have_content('Address')
    expect(page).to have_content('City')
    expect(page).to have_content('State')
    expect(page).to have_content('Zip')
  end

  scenario 'User fills out the form correctly' do
    conference1 = FactoryGirl.create(:conference)
    team1 = Team.create(name: 'Test', nickname: 'Turtles', conference: conference1, league: 'NCAAF', key: 'TTU')
    team2 = Team.create(name: 'Test2', nickname: 'Turtles2', conference: conference1, league: 'NCAAF', key: 'TTT')
    game1 = Game.create(week: 10, scheduled: 'noon', network: 'pbs', home_team_id: team1.id, away_team_id: team2.id)
    visit new_game_event_path(game1.id)

    fill_in('Name', with: 'Huskers Football')
    fill_in('Description', with: 'join other nebraska fans to watch them play wisconsin, yay')
    fill_in('Location', with: 'The Greatest Bar')
    fill_in('Address', with: '33 Portland Street')
    fill_in('City', with: 'Boston')
    fill_in('State', with: 'MA')
    fill_in('Zip', with: '02134')
    click_button('Create it!')
    expect(page).to have_content('Event added successfully')
  end

  scenario 'User sees showpage after creating event' do
    conference1 = FactoryGirl.create(:conference)
    team1 = Team.create(name: 'Test', nickname: 'Turtles', conference: conference1, league: 'NCAAF', key: 'TTU')
    team2 = Team.create(name: 'Test2', nickname: 'Turtles2', conference: conference1, league: 'NCAAF', key: 'TTT')
    game1 = Game.create(week: 10, scheduled: 'noon', network: 'pbs', home_team_id: team1.id, away_team_id: team2.id)
    visit new_game_event_path(game1.id)


    fill_in('Name', with: 'Huskers Football')
    fill_in('Description', with: 'join other nebraska fans to watch them play wisconsin, yay')
    fill_in('Location', with: 'The Greatest Bar')
    fill_in('Address', with: '33 Portland Street')
    fill_in('City', with: 'Boston')
    fill_in('State', with: 'MA')
    fill_in('Zip', with: '02134')
    click_button('Create it!')

    expect(page).to have_content('Huskers Football')
    expect(page).to have_content('join other nebraska fans to watch them play wisconsin, yay')
    expect(page).to have_content('The Greatest Bar')
    expect(page).to have_content('33 Portland Street')
    expect(page).to have_content('Boston')
    expect(page).to have_content('MA')
    expect(page).to have_content('02134')
  end

  scenario 'The user fills out the form incorrectly' do
    conference1 = FactoryGirl.create(:conference)
    team1 = Team.create(name: 'Test', nickname: 'Turtles', conference: conference1, league: 'NCAAF', key: 'TTU')
    team2 = Team.create(name: 'Test2', nickname: 'Turtles2', conference: conference1, league: 'NCAAF', key: 'TTT')
    game1 = Game.create(week: 10, scheduled: 'noon', network: 'pbs', home_team_id: team1.id, away_team_id: team2.id)
    visit new_game_event_path(game1.id)

      click_button('Create it!')
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Description can't be blank")
      expect(page).to have_content("Location can't be blank")
      expect(page).to have_content("Address can't be blank")
      expect(page).to have_content("City can't be blank")
      expect(page).to have_content("State can't be blank")
      expect(page).to have_content("Zip can't be blank")
  end
end
