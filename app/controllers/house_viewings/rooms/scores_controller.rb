# frozen_string_literal: true

module HouseViewings
  module Rooms
    class ScoresController < ApplicationController
      def new
        house_viewing = HouseViewing.find_by!(uuid: params[:house_viewing_uuid])
        @room = house_viewing.rooms.find(params[:room_id])
      end
    end
  end
end
