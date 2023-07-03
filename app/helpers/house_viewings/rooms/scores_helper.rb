# frozen_string_literal: true

module HouseViewings
  module Rooms
    module ScoresHelper
      SPECIFIC_EVALUATION_NAMES = {
        storage: { good: '充実', bad: '不足' },
        equipment: { good: '充実', bad: '不足' },
        rent: { good: '割安', bad: '割高' }
      }.freeze

      def evaluation_items
        column_names = Score.column_names
        column_names.select do |column|
          column.in?(%w[living_room storage kitchen bath toilet equipment surroundings rent])
        end
      end

      def good_evaluation_name(evaluation_item)
        SPECIFIC_EVALUATION_NAMES.dig(evaluation_item.to_sym, :good) || '良い'
      end

      def bad_evaluation_name(evaluation_item)
        SPECIFIC_EVALUATION_NAMES.dig(evaluation_item.to_sym, :bad) || '悪い'
      end
    end
  end
end
