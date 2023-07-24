# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HouseViewing, type: :model do
  describe '#to_param' do
    it 'pathとしてuuidが返されること' do
      house_viewing = build(:house_viewing)
      expect(house_viewing.to_param).to eq(house_viewing.uuid)
    end
  end
end
