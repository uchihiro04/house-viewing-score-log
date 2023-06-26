# frozen_string_literal: true

class Score < ApplicationRecord
  belongs_to :room
  with_options presence: true do
    validates :reviewer_name
    with_options numericality: { in: 1..5 } do
      validates :living_room
      validates :storage
      validates :kitchen
      validates :bath
      validates :toilet
      validates :equipment
      validates :surroundings
      validates :rent
    end
  end
end
