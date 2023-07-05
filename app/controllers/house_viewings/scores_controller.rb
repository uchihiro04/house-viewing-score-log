# frozen_string_literal: true

module HouseViewings
  class ScoresController < ApplicationController
    TOP_TWO = 2

    def index
      house_viewing = HouseViewing.find_by!(uuid: params[:house_viewing_uuid])
      @rooms = house_viewing.rooms.order(:created_at)

      @top_two_rooms = @rooms.max_by(TOP_TWO, &:average_total_score)
    end
  end
end
