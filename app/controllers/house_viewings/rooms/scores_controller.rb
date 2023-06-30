# frozen_string_literal: true

module HouseViewings
  module Rooms
    class ScoresController < ApplicationController
      before_action :set_house_viewing, only: %i[new create]
      before_action :set_room, only: %i[new create]

      def new
        @score = Score.new
      end

      def create
        room_name = params[:score][:room][:name]
        Score.transaction do
          @score = @room.scores.new(score_params)
          @room.update!(name: room_name) if @room.name != room_name
          @score.save!
          redirect_to house_viewing_rooms_path, notice: 'スコアを登録しました。'
        end
      rescue ActiveRecord::RecordInvalid
        render :new, status: :unprocessable_entity
      end

      private

      def set_house_viewing
        @house_viewing = HouseViewing.find_by!(uuid: params[:house_viewing_uuid])
      end

      def set_room
        @room = @house_viewing.rooms.find(params[:room_id])
      end

      def score_params
        params.require(:score).permit(:reviewer_name,
                                      :living_room,
                                      :storage,
                                      :kitchen,
                                      :bath,
                                      :toilet,
                                      :equipment,
                                      :surroundings,
                                      :rent)
      end
    end
  end
end
