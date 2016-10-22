require 'rails_helper'

feature 'Authorized users can add teams to their favorites' do
  scenario 'user visits profile and adds teams' do
    user1 = FactoryGirl.create(:user)
    login_as(user1)
    click_link 'Your Profile'
    click_link 'Add Favorite Teams'
  end
end
