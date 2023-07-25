# frozen_string_literal: true

FactoryBot.define do
  factory :score do
    reviewer_name { rand(1..5) }
    living_room { rand(1..5) }
    storage { rand(1..5) }
    kitchen { rand(1..5) }
    bath { rand(1..5) }
    toilet { rand(1..5) }
    equipment { rand(1..5) }
    surroundings { rand(1..5) }
    rent { rand(1..5) }
  end
end
