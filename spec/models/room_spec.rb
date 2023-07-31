# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Room, type: :model do
  let(:house_viewing) { create(:house_viewing) }
  let(:room) { create(:room, house_viewing:) }

  describe '#average_score' do
    before do
      test_values.each do |test_value|
        evaluation_items = { room: }
        Score::EVALUATION_ITEMS.each do |item|
          evaluation_items[item] = test_value
        end
        create(:score, evaluation_items)
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

  describe '#average_total_score' do
    before do
      test_values.each do |test_value|
        evaluation_items = { room: }
        Score::EVALUATION_ITEMS.each do |item|
          evaluation_items[item] = test_value
        end
        create(:score, evaluation_items)
      end
    end

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
      let!(:score) { create(:score, room:) }

      it 'trueを返すこと' do
        expect(Room.score_entered?(house_viewing.rooms.ids)).to be_truthy
      end
    end

    context 'スコアが未入力の場合' do
      it 'falseを返すこと' do
        expect(Room.score_entered?(house_viewing.rooms.ids)).to_not be_truthy
      end
    end
  end

  describe '#reviewer_names' do
    context 'スコア入力者が存在する場合' do
      let!(:score_one) { create(:score, room:, reviewer_name: '父') }
      let!(:score_two) { create(:score, room:, reviewer_name: '母') }
      let!(:score_three) { create(:score, room:, reviewer_name: '息子') }

      it 'スコア入力者の名前の配列を返すこと' do
        expect(room.reviewer_names).to eq %w[父 母 息子]
      end
    end

    context 'スコア入力者が存在しない場合' do
      it '空の配列を返すこと' do
        expect(room.reviewer_names).to be_empty
      end
    end
  end
end
