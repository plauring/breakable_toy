require 'rails_helper'

describe User do
  user1 = FactoryGirl.create(:user)
  user2 = FactoryGirl.build(:user, username: '')
  user3 = FactoryGirl.build(:user, email: '')
  user4 = FactoryGirl.build(:user, password: '')
  user5 = FactoryGirl.build(:user, first_name: '')
  user6 = FactoryGirl.build(:user, last_name: '')
  it 'is valid with valid attributes' do
    expect(user1).to be_valid
  end

  it 'is not valid with non-valid username' do
    expect(user2).to_not be_valid
    expect(user3).to_not be_valid
    expect(user4).to_not be_valid
    expect(user5).to_not be_valid
    expect(user6).to_not be_valid
  end

  it 'has a matching password confirmation for the password' do
    user7 = User.new
    user7.password = 'password'
    user7.password_confirmation = 'anotherpassword'

    expect(user7).to_not be_valid
    expect(user7.errors[:password_confirmation]).to_not be_blank
  end
end

describe '#admin?' do
  user8 = FactoryGirl.create(:user, role: 'member')
  user9 = FactoryGirl.create(:user, role: 'admin')

  it 'is not an admin if the role is not admin' do
    expect(user8.admin?).to eq(false)
  end

  it 'is an admin if the role is admin' do
    expect(user9.admin?).to eq(true)
  end
end
