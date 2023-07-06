# frozen_string_literal: true

module Description
  class HouseViewingsController < ApplicationController
    def show
      @house_viewing = HouseViewing.find_by!(uuid: params[:uuid])
    end
  end
end
