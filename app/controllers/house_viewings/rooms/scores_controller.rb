# frozen_string_literal: true

module HouseViewings
  module Rooms
    class ScoresController < ApplicationController
      def new
        @room = Room.find(params[:room_id])
      end
    end
  end
end
