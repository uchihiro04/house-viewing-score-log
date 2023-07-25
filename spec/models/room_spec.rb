# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Room, type: :model do
  describe '#average_score' do
    let(:house_viewing) { create(:house_viewing) }
    let(:room) { create(:room, house_viewing:) }
    let!(:scores) { create_list('score', 3, room:) }

    context 'スコアが存在する場合' do
      it 'スコアの平均値を返すこと' do
        # 1点、2点、3点の平均値を求めているため、平均値は2.0点になる。
        expect(room.reload.average_score(Score::EVALUATION_ITEMS.first)).to eq 2.0
      end
    end

    context 'スコアが存在しない場合' do
      it '0を返すこと' do
        expect(room.average_score(Score::EVALUATION_ITEMS.first)).to eq 0
      end
    end
  end
end
