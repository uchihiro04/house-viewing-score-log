# frozen_string_literal: true

class HouseViewing < ApplicationRecord
  has_many :rooms, dependent: :destroy
  validates :uuid, presence: true, uniqueness: true
  before_create :set_uuid
  after_create :create_rooms
  
  DEFAULT_ROOMS_COUNT = 10
  
  def set_uuid
    self.uuid = loop do
      generated_uuid = SecureRandom.uuid
      break generated_uuid unless self.class.exists?(uuid: generated_uuid)
    end
  end

  def create_rooms
    house_viewing_id = id
    DEFAULT_ROOMS_COUNT.times do |n|
      Room.create(name: "#{n + 1}件目", house_viewing_id:)
    end
  end
end
