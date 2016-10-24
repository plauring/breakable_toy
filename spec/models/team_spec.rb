require 'rails_helper'

describe Team do
  conference1 = Conference.create(name: 'Conference1', id: 1)
  conference2 = Conference.create(name: 'Conference2', id: 2)
  conference3 = Conference.create(name: 'Conference3', id: 3)
  conference4 = Conference.create(name: 'Conference4', id: 4)
  conference5 = Conference.create(name: 'Conference5', id: 5)
  team1 = FactoryGirl.create(:team)
  team2 = FactoryGirl.build(:team, nickname: '')
  team3 = FactoryGirl.build(:team, conference_id: 'abc')
  team4 = FactoryGirl.build(:team, league: '')
  team5 = FactoryGirl.build(:team, key: '')

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
