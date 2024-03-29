# frozen_string_literal: true

class HouseViewing < ApplicationRecord
  has_many :rooms, dependent: :destroy

  before_create :set_uuid
  after_create :create_rooms

  DEFAULT_ROOMS_COUNT = 10

  # to_paramメソッドをオーバーライドすることで、ヘルパーメソッドで生成されるURLについてuuidを使用する形に変更しています。
  def to_param
    uuid
  end

  private

  def set_uuid
    self.uuid = loop do
      generated_uuid = SecureRandom.uuid
      break generated_uuid unless self.class.exists?(uuid: generated_uuid)
    end
  end

  def create_rooms
    DEFAULT_ROOMS_COUNT.times do |n|
      rooms.create!(name: "#{n + 1}件目")
    end
  end
end
