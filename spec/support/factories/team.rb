require 'factory_girl_rails'

FactoryGirl.define do
  factory :team do
    sequence(:name) { |n| "Team#{n}" }
    sequence(:nickname) { |n| "Tigers#{n}" }
    sequence(:conference_id) { rand(1..5) }
    sequence(:league) { |n| "League#{n}" }
    sequence(:key) { |n| "Abbrev#{n}" }
  end
end
