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

      def specific_evaluation_names?(evaluation_item)
        SPECIFIC_EVALUATION_NAMES.key?(evaluation_item.to_sym)
      end

      def specific_good_evaluation_name(evaluation_item)
        SPECIFIC_EVALUATION_NAMES[evaluation_item.to_sym][:good]
      end

      def specific_bad_evaluation_name(evaluation_item)
        SPECIFIC_EVALUATION_NAMES[evaluation_item.to_sym][:bad]
      end
    end
  end
end
