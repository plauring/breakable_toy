require 'rails_helper'

feature 'authenticated user edits profile information' do
  let!(:user2) { FactoryGirl.create(:user) }

  scenario 'visits profile page and edits email' do
    login_as(user2, scope: :user, run_callbacks: false)
    visit root_path
    click_link 'Your Profile'
    expect(page).to have_content(user2.username)
    expect(page).to have_content(user2.email)

    click_link 'Edit your profile'
    fill_in 'Email', with: 'superfan@example.com'
    fill_in 'user_password', with: user2.password
    fill_in 'Password confirmation', with: user2.password
    fill_in 'Current password', with: user2.password
    click_button 'Update'
    expect(page).to have_content('Your account has been updated successfully')
  end
end
