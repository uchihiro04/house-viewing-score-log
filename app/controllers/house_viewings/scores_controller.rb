# frozen_string_literal: true

module HouseViewings
  class ScoresController < ApplicationController
    NUMBER_OF_DISPLAY = 2

    def index
      house_viewing = HouseViewing.find_by!(uuid: params[:house_viewing_uuid])
      @rooms = house_viewing.rooms.order(:created_at)

      @top_two_room_scores = @rooms.max_by(NUMBER_OF_DISPLAY, &:average_total_score)
    end
  end
end
