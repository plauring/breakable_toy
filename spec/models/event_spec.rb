require 'rails_helper'

describe Event do
  event1 = FactoryGirl.create(:event)
  event2 = FactoryGirl.build(:event, name: '')
  event3 = FactoryGirl.build(:event, description: '')
  event4 = FactoryGirl.build(:event, location: '')
  event5 = FactoryGirl.build(:event, city: '')
  event6 = FactoryGirl.build(:event, state: '')
  event7 = FactoryGirl.build(:event, zip: '')

  it 'is valid with valid attributes' do
    expect(event1).to be_valid
  end

  it 'is not valid without a name' do
    expect(event2).to_not be_valid
  end

  it 'is not valid without a description' do
    expect(event3).to_not be_valid
  end

  it 'is not valid without a location' do
    expect(event4).to_not be_valid
  end

  it 'is not valid without a city' do
    expect(event5).to_not be_valid
  end

  it 'is not valid without a state' do
    expect(event6).to_not be_valid
  end
  it 'is not valid without a zip' do
    expect(event7).to_not be_valid
  end
end
