class Language < ApplicationRecord
  belongs_to :cv
  scope :chronological_order, -> { order(created_at: :desc) }

  CEFR_LEVELS = %w[a1 a2 b1 b2 c1 c2].freeze

  validates :language, presence: true
  validates :level, inclusion: { in: CEFR_LEVELS }
end
