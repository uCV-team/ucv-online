class Language < ApplicationRecord
  CEFR_LEVELS = %w[a1 a2 b1 b2 c1 c2].freeze

  belongs_to :cv, touch: true

  validates :language, presence: true
  validates :level, inclusion: { in: CEFR_LEVELS }

  scope :chronological_order, -> { order(created_at: :desc) }
end
