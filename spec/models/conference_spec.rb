require 'rails_helper'

describe Membership do
  conference1 = FactoryGirl.create(:conference)
  conference2 = FactoryGirl.build(:conference, name: '')

  it 'is valid with valid attributes' do
    expect(conference1).to be_valid
  end

  it 'is not valid without a name ' do
    expect(conference2).to_not be_valid
  end
end
