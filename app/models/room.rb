# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :scores, dependent: :destroy
  belongs_to :house_viewing
  validates :name, presence: true
end
