# frozen_string_literal: true

module HouseViewings
  module RoomsHelper
    def scores?(rooms)
      Score.where(room_id: rooms.ids).exists?
    end
  end
end
