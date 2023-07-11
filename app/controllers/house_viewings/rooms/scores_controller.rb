# frozen_string_literal: true

module HouseViewings
  module Rooms
    class ScoresController < ApplicationController
      before_action :set_house_viewing, :set_room
      before_action :set_score, only: %i[edit update]

      def index
        redirect_to house_viewing_scores_path, alert: t('alert.no_scores') unless Room.score_entered?(@room.id)
      end

      def new
        @score = Score.new
      end

      def edit; end

      def create
        set_room_name
        @score = @room.scores.new(score_params)

        if @room.save
          redirect_to house_viewing_rooms_path, notice: t('notice.create', model: @score.model_name.human)
        else
          render :new, status: :unprocessable_entity
        end
      end

      def update
        set_room_name
        if @score.update(score_params)
          redirect_to house_viewing_rooms_path, notice: t('notice.update', model: @score.model_name.human)
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

      def set_room_name
        @room.name = params[:score][:room][:name]
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
