# frozen_string_literal: true

module HouseViewings
  module Rooms
    class ScoresController < ApplicationController
      def new
        house_viewing = HouseViewing.find_by!(uuid: params[:house_viewing_uuid])
        @room = house_viewing.rooms.find(params[:room_id])
      end

      def create
        @room = Room.find(params[:room_id])
        @score = @room.scores.new(score_params)

        if @score.save
          redirect_to house_viewing_rooms_path, notice: 'スコアを登録しました。'
        else
          render :new, status: :unprocessable_entity
        end
      end

      private

      def score_params
        params.require(:score).permit(:reviewer_name, :living_room, :storage, :kitchen, :bath, :toilet, :equipment, :surroundings, :rent)
      end
    end
  end
end
