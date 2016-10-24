require 'rails_helper'

feature 'Authorized users can add teams to their favorites' do

  scenario 'user visits profile page and sees buttons for each conference' do
    conf = FactoryGirl.create(:conference)
    conf2 = FactoryGirl.create(:conference)
    user1 = FactoryGirl.create(:user)
    login_as(user1)
    visit root_path
    click_link 'Your Profile'
    expect(page).to have_content(conf.name)
    expect(page).to have_content(conf2.name)
  end
#  waiting for clinic on testing js
#   scenario 'user clicks conference button and sees conference teams' do
#     conf = FactoryGirl.create(:conference)
#     team1 = FactoryGirl.create(:team, conference: conf)
#     team2 = FactoryGirl.create(:team, conference: conf)
#     user1 = FactoryGirl.create(:user)
#     login_as(user1)
#     visit user_path(user1)
#     click_button "#{conf.name}"
#     expect(page).to have_content(team1.name)
#     expect(page).to have_content(team2.name)
#   end
end
