require 'securerandom'

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "bar.bar#{n}@example.com" }
    display_name 'bar_bar'
    password '12345678'
  end
end