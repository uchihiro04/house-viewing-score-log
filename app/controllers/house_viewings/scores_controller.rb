# frozen_string_literal: true

module HouseViewings
  class ScoresController < ApplicationController
    def index
      house_viewing = HouseViewing.find_by!(uuid: params[:house_viewing_uuid])
      @rooms = house_viewing.rooms.order(:created_at)

      number_of_display = 2
      @top_two_room_scores = @rooms.max_by(number_of_display, &:average_total_score)
    end
  end
end
