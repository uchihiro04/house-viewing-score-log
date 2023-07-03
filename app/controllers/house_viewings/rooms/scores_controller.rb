# frozen_string_literal: true

module HouseViewings
  module Rooms
    class ScoresController < ApplicationController
      before_action :set_house_viewing, :set_room, only: %i[new create edit update]
      before_action :set_score, only: %i[edit update]
      before_action :fetch_room_name, only: %i[create update]

      def new
        @score = Score.new
      end

      def edit; end

      def create
        @score = @room.scores.new(score_params)
        @room.name = @room_name if @room.name != @room_name

        if @room.save
          redirect_to house_viewing_rooms_path, notice: t('notice.create', model: @score.class.model_name.human)
        else
          render :new, status: :unprocessable_entity
        end
      end

      def update
        @room.name = @room_name if @room.name != @room_name

        if @score.update(score_params)
          redirect_to house_viewing_rooms_path, notice: t('notice.update', model: @score.class.model_name.human)
        else
          render :edit, status: :unprocessable_entity
        end
      end

      private

      def set_house_viewing
        @house_viewing = HouseViewing.find_by!(uuid: params[:house_viewing_uuid])
      end

      def set_room
        @room = @house_viewing.rooms.find(params[:room_id])
      end

      def fetch_room_name
        @room_name = params[:score][:room][:name]
      end

      def set_score
        @score = @room.scores.find(params[:id])
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
