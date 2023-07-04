# frozen_string_literal: true

class Score < ApplicationRecord
  belongs_to :room, autosave: true

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

  EVALUATION_ITEMS = %i[living_room storage kitchen bath toilet equipment surroundings rent].freeze
end
