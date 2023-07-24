# frozen_string_literal: true

FactoryBot.define do
  factory :house_viewing do
    uuid { SecureRandom.uuid }
  end
end
