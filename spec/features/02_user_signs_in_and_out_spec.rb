require 'rails_helper'

feature 'user signs in and out' do
  context 'After signing up initially I want to' do
    let!(:user2) { FactoryGirl.create(:user) }
    before do
      login_as(user2, scope: :user, run_callbacks: false)
      visit root_path
    end

    scenario 'sign out successfully' do
      click_link 'Sign Out'
      expect(page).to have_content('Signed out successfully.')
      expect(page).to have_content('Sign In')
      expect(page).to_not have_content('Sign Out')
    end

    scenario 'sign in successfully' do
      click_link 'Sign Out'
      click_link 'Sign In'
      fill_in 'Email', with: user2.email
      fill_in 'Password', with: user2.password
      click_button 'Sign In'
      expect(page).to have_content('Signed in successfully.')
      expect(page).to have_content('Sign Out')
    end

    scenario 'sign in unsuccessfully with wrong password' do
      click_link 'Sign Out'
      click_link 'Sign In'
      fill_in 'Email', with: user2.email
      fill_in 'Password', with: 'wongpass'
      click_button 'Sign In'
      expect(page).to have_content('Invalid Email or password.')
      expect(page).to have_content('Sign In')
      expect(page).to_not have_content('Sign Out')
    end

    scenario 'sign in unsuccessfully with wrong email' do
      click_link 'Sign Out'
      click_link 'Sign In'
      fill_in 'Email', with: 'wrong@example.com'
      fill_in 'Password', with: user2.password
      click_button 'Sign In'
      expect(page).to have_content('Invalid Email or password.')
      expect(page).to have_content('Sign In')
      expect(page).to_not have_content('Sign Out')
    end
  end
end
