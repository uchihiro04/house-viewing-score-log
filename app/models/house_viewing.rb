# frozen_string_literal: true

class HouseViewing < ApplicationRecord
  validates :uuid, presence: true, uniqueness: true
  before_validation :create_uuid

  def create_uuid
    uuid = SecureRandom.uuid
    self.uuid = uuid
  end
end
