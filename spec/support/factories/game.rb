require 'factory_girl_rails'

FactoryGirl.define do
  factory :game do
    sequence(:week) { |n| "Week#{n}" }
    sequence(:scheduled) { |n| "Novemeber#{n}th" }
    sequence(:network) { |n| "ESPN#{n}" }
    sequence(:home_team_id) { |n| n }
    sequence(:away_team_id) { |n| n }
  end
end
