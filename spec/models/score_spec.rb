# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Score, type: :model do
  let(:house_viewing) { create(:house_viewing) }
  let(:room) { create(:room, house_viewing:) }

  describe 'バリデーション' do
    context '数値が0以下の場合' do
      let(:score) { build(:score, room:, living_room: 0) }

      it 'リビングの数値が無効であること' do
        score.valid?
        expect(score.errors.full_messages).to include('リビングは1..5の範囲に含めてください')
      end
    end
  end
end
