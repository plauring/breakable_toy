require 'factory_girl_rails'

FactoryGirl.define do
  factory :conference do
    sequence(:name) { |n| "Conference#{n}" }
    sequence(:id) { |n| n }
  end
end
