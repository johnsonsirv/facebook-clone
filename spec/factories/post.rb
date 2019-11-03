# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    user

    content { Faker::Lorem.paragraph }
  end
end
