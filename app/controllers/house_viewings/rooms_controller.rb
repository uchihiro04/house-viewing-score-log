class HouseViewings::RoomsController < ApplicationController
  def index
    house_viewing = HouseViewing.find_by!(uuid: params[:house_viewing_uuid])
    @rooms = house_viewing.rooms
  end
end
