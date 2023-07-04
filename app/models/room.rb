# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :scores, dependent: :destroy
  belongs_to :house_viewing

  validates :name, presence: true

  def average_total_score
    sum_total_scores = Score::EVALUATION_ITEMS.sum { |attribute_name| scores.sum(attribute_name) }.to_f
    return 0 unless scores.present?
    (sum_total_scores / number_of_scores).round
  end

  def average_score(attribute_name)
    return 0 unless scores.present?
    (scores.sum(attribute_name).to_f / number_of_scores).round
  end

  private

  def number_of_scores
    scores.length
  end
end
