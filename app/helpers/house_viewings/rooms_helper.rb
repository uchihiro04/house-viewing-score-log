# frozen_string_literal: true

module HouseViewings
  module RoomsHelper
    def scores?(rooms)
      rooms.any? { |room| room.scores.exists? }
    end
  end
end
