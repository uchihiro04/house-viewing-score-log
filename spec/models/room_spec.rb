# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Room, type: :model do
  describe '#average_score' do
    let(:house_viewing) { create(:house_viewing) }
    let(:room) { create(:room, house_viewing:) }

    before do
      test_values.each do |test_value|
        create(:score, room:, Score::EVALUATION_ITEMS.first => test_value)
      end
    end

    context 'スコアが存在する場合' do
      let(:test_values) { [1, 2, 3] }

      it 'スコアの平均値を返すこと' do
        # 1点、2点、3点の平均値を求めているため、平均値は2.0点になる。
        expect(room.reload.average_score(Score::EVALUATION_ITEMS.first)).to eq 2.0
      end
    end

    context 'スコアが存在しない場合' do
      let(:test_values) { [] }

      it '0を返すこと' do
        expect(room.reload.average_score(Score::EVALUATION_ITEMS.first)).to eq 0
      end
    end
  end
end
