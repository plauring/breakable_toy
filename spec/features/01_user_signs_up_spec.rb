require 'rails_helper'

feature 'user visits homepage and signs up' do
  scenario 'unauthenticated user signs up with valid information' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'plauring'
    fill_in 'First name', with: 'Pete'
    fill_in 'Last name', with: 'Lauring'
    fill_in 'Email', with: 'plauring@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
  end

  scenario 'unauthenticated user signs up with invalid information' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'unauthenticated users password does not match confirmation' do
    visit root_path
    click_link 'Sign Up'

    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'somethingdifferent'

    click_button 'Sign up'

    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content("Sign Out")
  end
end
