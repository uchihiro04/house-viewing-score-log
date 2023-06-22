class HouseViewing < ApplicationRecord
  validates :uuid, presence: true, uniqueness: true
end
