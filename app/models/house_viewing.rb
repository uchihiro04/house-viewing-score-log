# frozen_string_literal: true

class HouseViewing < ApplicationRecord
  has_many :rooms
  validates :uuid, presence: true, uniqueness: true
  before_create :set_uuid

  def set_uuid
    self.uuid = loop do
      generated_uuid = SecureRandom.uuid
      break generated_uuid unless self.class.exists?(uuid: generated_uuid)
    end
  end
end
