# frozen_string_literal: true

module HouseViewings
  class ScoresController < ApplicationController
    def index
      house_viewing = HouseViewing.find_by!(uuid: params[:house_viewing_uuid])
      @rooms = house_viewing.rooms.order(:created_at)

      room_scores = {}
      @rooms.each do |room|
        room_scores[room.name] = room.average_total_score
      end
      @top_two_scores = room_scores.sort_by { |_key, value| -value }.first(2)
    end
  end
end
