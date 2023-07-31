# frozen_string_literal: true

module Dashboard
  class RoomsController < ApplicationController
    MINIMUM_SCORE = 0
    MAXIMUM_SCORE = 40

    def index
      @rooms = Room.all.includes(:scores).select do |room|
        room.average_total_score.between?(min_score, max_score)
      end
    end

    private

    def min_score
      params[:min_score].present? ? params[:min_score].to_i : MINIMUM_SCORE
    end

    def max_score
      params[:max_score].present? ? params[:max_score].to_i : MAXIMUM_SCORE
    end
  end
end
