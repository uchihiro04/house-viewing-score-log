# frozen_string_literal: true

class Room < ApplicationRecord
  belongs_to :house_viewing
  validates :name, presence: true
end
