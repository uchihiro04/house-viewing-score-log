# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Room, type: :model do
  let(:house_viewing) { create(:house_viewing) }
  let(:room) { create(:room, house_viewing:) }

  before do
    test_values.each do |test_value|
      evaluation_items = { room: }
      Score::EVALUATION_ITEMS.each do |item|
        evaluation_items[item] = test_value
      end
      create(:score, evaluation_items)
    end
  end

  describe '#average_score' do
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

  describe '#average_total_score' do
    context 'スコアが存在する場合' do
      let(:test_values) { [1, 2, 3] }

      it '合計スコアの平均値を返すこと' do
        # 合計点が8点、16点、24点の平均値を求めているため、平均値は16点になる。
        expect(room.reload.average_total_score).to eq 16
      end
    end

    context 'スコアが存在しない場合' do
      let(:test_values) { [] }

      it '0を返すこと' do
        expect(room.reload.average_total_score).to eq 0
      end
    end
  end

  describe '.score_entered?' do
    context 'スコアが入力済みの場合' do
      let(:test_values) { [1, 2, 3] }

      it 'trueを返すこと' do
        expect(Room.score_entered?(house_viewing.rooms.ids)).to be_truthy
      end
    end

    context 'スコアが未入力の場合' do
      let(:test_values) { [] }

      it 'falseを返すこと' do
        expect(Room.score_entered?(house_viewing.rooms.ids)).to_not be_truthy
      end
    end
  end
end
