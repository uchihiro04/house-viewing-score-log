# frozen_string_literal: true

module HouseViewings
  class ScoresController < ApplicationController
    TOP_TWO = 2

    def index
      house_viewing = HouseViewing.find_by!(uuid: params[:house_viewing_uuid])
      @rooms = house_viewing.rooms.includes(:scores).order(:created_at)

      redirect_to house_viewing_rooms_path, alert: t('alert.no_scores') if rooms_score_blank?

      @top_two_rooms = @rooms.max_by(TOP_TWO, &:average_total_score)
    end

    private

    def rooms_score_blank?
      @rooms.all? { |room| room.scores.blank? }
    end
  end
end
