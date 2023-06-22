class Room < ApplicationRecord
  validates :house_viewing_id, presence: true
  validates :name, presence: true
end
