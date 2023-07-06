# frozen_string_literal: true

module HouseViewings
  module RoomsHelper
    def description_page_url(house_viewing)
      "#{request.base_url}/description/house_viewings/#{house_viewing.uuid}"
    end
  end
end
