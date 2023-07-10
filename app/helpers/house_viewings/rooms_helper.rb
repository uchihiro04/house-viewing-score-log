# frozen_string_literal: true

module HouseViewings
  module RoomsHelper
    def scores?(rooms)
      Score.exists?(room_id: rooms.ids)
    end
  end
end
