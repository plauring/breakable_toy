require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "Sportsfan#{n}" }
    sequence(:email) { |n| "Sportsfan#{n}@launchacademy.com" }
    sequence(:password) { |n| "password#{n}" }
    sequence(:first_name) { |n| "first_name#{n}" }
    sequence(:last_name) { |n| "last_name#{n}" }
  end
end
