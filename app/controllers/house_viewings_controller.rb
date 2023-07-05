# frozen_string_literal: true

class HouseViewingsController < ApplicationController
  def create
    house_viewing = HouseViewing.create
    redirect_to house_viewing_rooms_path(house_viewing),
                notice: t('notice.create', model: house_viewing.model_name.human)
  end
end
