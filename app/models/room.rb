# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :scores, dependent: :destroy
  belongs_to :house_viewing

  validates :name, presence: true

  def average_total_score
    sum_total_scores = Score::EVALUATION_ITEMS.sum { |attribute_name| scores.sum(attribute_name) }.to_f
    return 0 if scores.blank?

    (sum_total_scores / scores.length).round
  end

  def average_score(attribute_name)
    return 0 if scores.blank?

    (scores.sum(attribute_name).to_f / scores.length).round
  end
end
