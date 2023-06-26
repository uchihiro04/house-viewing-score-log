# frozen_string_literal: true

class Score < ApplicationRecord
  belongs_to :room
  validates :reviewer_name, presence: true
  validates :living_room, presence: true, numericality: { in: 1..5 }
  validates :storage, presence: true, numericality: { in: 1..5 }
  validates :kitchen, presence: true, numericality: { in: 1..5 }
  validates :bath, presence: true, numericality: { in: 1..5 }
  validates :toilet, presence: true, numericality: { in: 1..5 }
  validates :equipment, presence: true, numericality: { in: 1..5 }
  validates :surroundings, presence: true, numericality: { in: 1..5 }
  validates :rent, presence: true, numericality: { in: 1..5 }
end
