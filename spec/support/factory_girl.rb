require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "Sportsfan#{n}" }
    sequence(:email) { |n| "Sportsfan#{n}@launchacademy.com" }
    sequence(:password) { |n| "password#{n}" }
    sequence(:first_name) { |n| "first_name#{n}" }
    sequence(:last_name) { |n| "last_name#{n}" }
  end

  factory :event do
    sequence(:name) { |n| "Meetup#{n}" }
    sequence(:description) { |n| "Come watch Team#{n} play Team B" }
    sequence(:location) { |n| "Bar#{n}" }
    sequence(:address) { |n| "#{n} Main Street" }
    sequence(:city) { |n| "Boston#{n}" }
    sequence(:state) { |n| "MA#{n}" }
    sequence(:zip) { |n| "0211#{n}" }
    game
  end

  factory :game do
    sequence(:week) { |n| "Week#{n}" }
    sequence(:scheduled) { |n| "Novemeber#{n}th" }
    sequence(:network) { |n| "ESPN#{n}" }
    association :home_team, factory: team
    association :away_team, factory: team
  end

  factory :conference do
    sequence(:name) { |n| "Conference#{n}" }
  end

  factory :team do
    sequence(:name) { |n| "Team#{n}" }
    sequence(:nickname) { |n| "Tigers#{n}" }
    sequence(:league) { |n| "League#{n}" }
    sequence(:key) { |n| "Abbrev#{n}" }
    conference
  end

end
