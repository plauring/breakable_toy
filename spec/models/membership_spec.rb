require 'rails_helper'

describe Membership do
  it "is valid with valid attributes" do
      user1 = FactoryGirl.create(:user)
      event1 = FactoryGirl.create(:event)

      if user1.save && event1.save
        expect(Membership.new(user_id: user1.id, event_id: event1.id)).to be_valid
      end
    end
end
