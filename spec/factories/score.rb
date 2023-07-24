# frozen_string_literal: true

FactoryBot.define do
  factory :score do
    sequence(:reviewer_name) { |n| "ユーザー#{n}" }
    sequence(:living_room) { |n| n }
    sequence(:storage) { |n| n }
    sequence(:kitchen) { |n| n }
    sequence(:bath) { |n| n }
    sequence(:toilet) { |n| n }
    sequence(:equipment) { |n| n }
    sequence(:surroundings) { |n| n }
    sequence(:rent) { |n| n }
  end
end
