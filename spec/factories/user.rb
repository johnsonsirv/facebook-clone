# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    dob { Faker::Date.birthday(min_age: 18) }
    sex { %w[Female Male Custom].sample }
  end
end
