# frozen_string_literal: true

class Room < ApplicationRecord
  validates :house_viewing_id, presence: true
  validates :name, presence: true
end
