require 'rails_helper'

describe Team do
  conference1 = FactoryGirl.create(:conference)
  team1 = FactoryGirl.create(:team, conference: conference1)
  team2 = FactoryGirl.build(:team, conference: conference1, nickname: '')
  team3 = FactoryGirl.build(:team, conference_id: 'abc')
  team4 = FactoryGirl.build(:team, league: '', conference: conference1)
  team5 = FactoryGirl.build(:team, key: '', conference: conference1)

  it 'is valid with valid attributes' do
    expect(team1).to be_valid
  end

  it 'is not valid without a nickname' do
    expect(team2).to_not be_valid
  end

  it 'is not valid without a conference_id as integer' do
    expect(team3).to_not be_valid
  end

  it 'is not valid without a league' do
    expect(team4).to_not be_valid
  end

  it 'is not valid without a key' do
    expect(team5).to_not be_valid
  end
end
