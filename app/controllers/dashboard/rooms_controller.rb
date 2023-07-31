# frozen_string_literal: true

module Dashboard
  class RoomsController < ApplicationController
    def index
      min_score = params[:min_score].present? ? params[:min_score].to_i : 0
      max_score = params[:max_score].present? ? params[:max_score].to_i : 40
      @rooms = Room.all.includes(:scores).select do |room|
        min_score <= room.average_total_score && room.average_total_score <= max_score
      end
    end
  end
end
