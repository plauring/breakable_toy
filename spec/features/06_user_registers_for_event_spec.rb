require 'rails_helper'

feature 'Authorized user registers for an event' do
  before do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    login_as(user1)
  end
  scenario 'user visits event show page and registers for event' do
    event1 = FactoryGirl.create(:event)
    visit event_path(event1.id)
    click_link 'Attend'
    expect(page).to have_content(user1.username)
  end
end
