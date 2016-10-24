require 'rails_helper'

describe Favorite do
  it 'is valid with valid attributes' do
    user1 = FactoryGirl.create(:user)
    conference1 = FactoryGirl.create(:conference, id: 6)
    team1 = FactoryGirl.create(:team, conference: conference1)
    if user1.save && team1.save
      expect(Favorite.new(user_id: user1.id, team_id: team1.id)).to be_valid
    end
  end
end
