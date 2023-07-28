# frozen_string_literal: true

module Dashboard
  class RoomsController < ApplicationController
    def index
      @rooms = Room.all
    end
  end
end
