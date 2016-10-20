require 'factory_girl_rails'

FactoryGirl.define do
  factory :event do
    sequence(:name) { |n| "Meetup#{n}" }
    sequence(:description) { |n| "Come watch Team#{n} play Team B" }
    sequence(:location) { |n| "Bar#{n}" }
    sequence(:address) { |n| "#{n} Main Street" }
    sequence(:city) { |n| "Boston#{n}" }
    sequence(:state) { |n| "MA#{n}" }
    sequence(:zip) { |n| "0211#{n}" }
  end
end
