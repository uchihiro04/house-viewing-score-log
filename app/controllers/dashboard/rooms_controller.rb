# frozen_string_literal: true

module Dashboard
  class RoomsController < ApplicationController
    def index
      @rooms = Room.all.includes(:scores).select do |room|
        room.average_total_score.between?(min_score, max_score)
      end
    end

    private

    def min_score
      params[:min_score].present? ? params[:min_score].to_i : 0
    end

    def max_score
      params[:max_score].present? ? params[:max_score].to_i : 40
    end
  end
end
