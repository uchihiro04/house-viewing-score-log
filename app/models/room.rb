# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :scores, dependent: :destroy
  belongs_to :house_viewing

  validates :name, presence: true

  def average_total_score
    sum_total_scores = Score::EVALUATION_ITEMS.sum { |attribute_name| scores.sum(attribute_name) }.to_f
    if number_of_scores.positive?
      (sum_total_scores / number_of_scores).round
    else
      0
    end
  end

  def average_score(attribute_name)
    if number_of_scores.positive?
      (scores.sum(attribute_name).to_f / number_of_scores).round
    else
      0
    end
  end

  private

  def number_of_scores
    scores.length
  end
end
