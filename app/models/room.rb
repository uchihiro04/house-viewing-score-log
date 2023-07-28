# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :scores, dependent: :destroy
  belongs_to :house_viewing

  validates :name, presence: true

  def self.score_entered?(room_ids)
    Score.exists?(room_id: room_ids)
  end

  def average_total_score
    Score::EVALUATION_ITEMS.sum { |attribute_name| average_score(attribute_name) }
  end

  def average_score(attribute_name)
    return 0 if scores.blank?

    (scores.sum { |score| score.send(attribute_name) }.to_f / scores.length).round(1)
  end

  def reviewer_names
    scores.pluck(:reviewer_name)
  end
end
