require 'rails_helper'

feature 'as an authenticated user I can create an event' do
  before do
    user1 = FactoryGirl.create(:user)
    login_as(user1, scope: :user)
    visit new_event_path
  end

  scenario 'The new event page shows the correct form fields' do
    expect(page).to have_content('Name')
    expect(page).to have_content('Description')
    expect(page).to have_content('Location')
    expect(page).to have_content('Address')
    expect(page).to have_content('City')
    expect(page).to have_content('State')
    expect(page).to have_content('Zip')
  end

  scenario 'User fills out the form correctly' do
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
      click_button('Create it!')
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Description can't be blank")
      expect(page).to have_content("Location can't be blank")
      expect(page).to have_content("Address can't be blank")
      expect(page).to have_content("City can't be blank")
      expect(page).to have_content("State can't be blank")
      expect(page).to have_content("Zip can't be blank")
  end

  scenario 'unauthorized user cannot create event' do
    visit root_path
    logout(:user)
    click_link 'Create new event'
    expect(page).to have_content("Sign in or Sign up to create an event")

  end


end
