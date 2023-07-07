# frozen_string_literal: true

module HouseViewings
  class RoomsController < ApplicationController
    def index
      @house_viewing = HouseViewing.find_by!(uuid: params[:house_viewing_uuid])
      @rooms = @house_viewing.rooms.order(:created_at)
    end
  end
end
