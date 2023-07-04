# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :scores, dependent: :destroy
  belongs_to :house_viewing

  validates :name, presence: true

  EVALUATION_ITEMS = %i[living_room storage kitchen bath toilet equipment surroundings rent].freeze

  def average_total_score
    sum_total_scores = EVALUATION_ITEMS.sum { |attribute_name| scores.sum(attribute_name) }.to_f
    if scores.length.positive?
      (sum_total_scores / scores.length).round
    else
      0
    end
  end

  def average_score(attribute_name)
    if scores.length.positive?
      (scores.sum(attribute_name).to_f / scores.length).round
    else
      0
    end
  end
end
