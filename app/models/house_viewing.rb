# frozen_string_literal: true

class HouseViewing < ApplicationRecord
  has_many :rooms
  validates :uuid, presence: true, uniqueness: true
  before_create :set_uuid
  after_create :create_rooms

  def set_uuid
    self.uuid = loop do
      generated_uuid = SecureRandom.uuid
      break generated_uuid unless self.class.exists?(uuid: generated_uuid)
    end
  end

  def create_rooms
    house_viewing_id = self.id
    10.times do |n|
      Room.create(name: "#{n + 1}件目", house_viewing_id: house_viewing_id)
    end
  end
end
